#include <cereal/cereal.hpp>
#include <cereal/types/vector.hpp>
#include <cereal/types/array.hpp>
#include <cereal/types/tuple.hpp>
#include <cereal/archives/portable_binary.hpp>

#include <string>
#include <vector>
#include <cstdlib>
#include <memory>
#include <iomanip>
#include <random>
#include <fstream>
#include <algorithm>

#include "chess_game.h"
#include "chessnet_config.h"

ChessPlayerAgent::ChessPlayerAgent(color agent_color, istream& player_input) : ChessAgent(agent_color), 
    input(player_input),
    player_mcts(GameState()){}


bool ChessPlayerAgent::prompt_next_move(move_vector& move, ostream& log, bool verbose){
    
    // check if we can actually make a move, or if we are
    // in a final state:
    auto moves = vector<move_vector>();
    if(!player_mcts.get_state_actions(moves)){
        return false;
    }

    // print prompt (if verbose)
    if(verbose){
        log << "Enter next move:" << endl 
            << ((agent_color == WHITE)? "White~> " : "Black~> ");
    }

    // read line 
    string input_str;
    getline(input, input_str);

    // handle invalid input:
    while(!parse_text_move(move,player_mcts.get_state(), agent_color, input_str)){
        log << "The move \"" << input_str << "\" is invalid." << endl
            << "Enter a move with the source and target rank & file." << endl
            << "(e.g.: \"a2 a4\"):" << endl 
            << ((agent_color == WHITE)? "White~> " : "Black~> ");
        getline(input, input_str);

    }

    return true;
}

void ChessPlayerAgent::apply_move(move_vector& move, ostream& log, bool verbose){
    
    string move_str = to_movestring(player_mcts.get_state(),move);
    player_mcts.apply_state_action(move);
    if(verbose){
        log << move_str << endl;
        log << player_mcts.get_state() << endl;
    }
}

void ChessPlayerAgent::end_of_game_callback(ostream& log, bool verbose){
    auto final_state = player_mcts.get_state().state;
    
    if(verbose){
        if(final_state & B_CHECKMATE){
            log << "Black checkmate. White wins." << endl;
        } else if(final_state & W_CHECKMATE){
            log << "White checkmate. Black wins." << endl;
        } else {
            log << "Game ended in a draw." << endl;
        }
    }
}

void ChessPlayerAgent::reset_agent(ostream& log, bool verbose){
    player_mcts.clear_cache();
    player_mcts.reset_to_state(GameState());
}


ChessNetAgent::ChessNetAgent(color agent_color, string model_path, unsigned int sims_per_move) : ChessAgent(agent_color),
    nnet_mcts(ChessNetMCTS(GameState(),model_path)) {
    this->game_boards = vector<array<piece,64>>();
    this->game_probs = vector<array<double,64*64>>();
    this->game_moves = vector<move_vector>();
    this->game_value = 0.0;
    this->sims_per_move = sims_per_move;

    this->rng_engine.seed(std::chrono::system_clock::now().time_since_epoch().count());
    this->random_prob = uniform_real_distribution<double>(0.0,1.0);
}

ChessNetAgent::ChessNetAgent(color agent_color, cppflow::model& model, unsigned int sims_per_move) : ChessAgent(agent_color),
    nnet_mcts(ChessNetMCTS(GameState(),model)) {
    this->game_boards = vector<array<piece,64>>();
    this->game_probs = vector<array<double,64*64>>();
    this->game_moves = vector<move_vector>();
    this->game_value = 0.0;
    this->sims_per_move = sims_per_move;

    this->rng_engine.seed(std::chrono::system_clock::now().time_since_epoch().count());
    this->random_prob = uniform_real_distribution<double>(0.0,1.0);
}

bool ChessNetAgent::prompt_next_move(move_vector& move, ostream& log, bool verbose){
    
    vector<move_vector> valid_moves;
    vector<double> valid_move_probs;
    
    // determine if a valid move can be made:
    if(!nnet_mcts.get_state_actions(valid_moves)){
        return false;
    }

    // run several simulations to generate improved policy distribution:
    nnet_mcts.run(sims_per_move);
    nnet_mcts.get_state_action_distribution(valid_move_probs);
    assert(valid_move_probs.size() > 0);
    assert(valid_moves.size() == valid_move_probs.size());

    // randomly sample from probability distribution:
    double prob_tgt = random_prob(rng_engine);
    double prob_sum = 0.0;
    for(unsigned int i = 0; i < valid_move_probs.size(); ++i){
        prob_sum += valid_move_probs[i];
        if(prob_sum > prob_tgt){
            move = valid_moves[i];
            return true;
        }
    }

    move = valid_moves.back();
    return true;
}

void ChessNetAgent::apply_move(move_vector& move, ostream& log, bool verbose){

    // record game board and move:
    game_boards.push_back(nnet_mcts.get_state().board);
    game_moves.push_back(move);

    // apply move to game state:
    string move_str = to_movestring(nnet_mcts.get_state(),move);
    nnet_mcts.apply_state_action(move);
    if(verbose){
        log << move_str << endl;
        log << nnet_mcts.get_state() << endl;
    }
}

void ChessNetAgent::end_of_game_callback(ostream& log, bool verbose){
    
    // determine final value of game:
    game_value = nnet_mcts.get_final_state_value();

    // fill game_probs tensors with zeros:
    for(unsigned int i = 0; i < game_moves.size(); ++i){
        game_probs.emplace_back();
        game_probs.back().fill(0.0);
    }

    // backtrack states and record improved action probs:
    vector<move_vector> actions;
    vector<double> action_distribution;
    for(int i = game_moves.size()-1; i >= 0; --i){

        // obtain the state actions and improved distributions at each step:
        move_vector m = game_moves[i];
        nnet_mcts.undo_state_action(m);
        actions.clear();
        action_distribution.clear();
        nnet_mcts.get_state_actions(actions);
        bool found_distr = nnet_mcts.get_state_action_distribution(action_distribution);

        if(!found_distr){
            // fall back to a delta-like distribution about the move made:
            action_distribution.clear();
            for(unsigned int i = 0; i < actions.size(); ++i){
                action_distribution.push_back((actions[i] == m)? 1.0 : 0.0);
            }
        }
        
        assert(actions.size() == action_distribution.size());
        assert(actions.size() > 0);

        // populate game_probs tensor:
        for(unsigned int j = 0; j < actions.size(); ++j){
            move_vector a = actions[j];
            unsigned int idx = (src_y(a)<<9) | (src_x(a)<<6) | (dest_y(a)<<3) | dest_x(a);
            game_probs[i][idx] = action_distribution[j];
        }
    }

    // return to final state of the game:
    for(move_vector m : game_moves){
        nnet_mcts.apply_state_action(m);
    }
}

void ChessNetAgent::reset_agent(ostream& log, bool verbose){
    nnet_mcts.reset_to_state(GameState());
    game_moves.clear();
    game_boards.clear();
    game_probs.clear();
}

void ChessNetAgent::clear_agent_cache(ostream& log, bool verbose){
    nnet_mcts.clear_cache();
    if(verbose){ 
        log << "Cleared " 
            << ((agent_color == WHITE)? "White" : "Black")
            << " agent Cache." << endl;
    }
}


void ChessNetAgent::get_training_data(chessnet_dataset& dataset){
    assert(game_boards.size() == game_probs.size());

    for(unsigned int i = 0; i < game_boards.size(); ++i){
        dataset.emplace_back(game_boards[i],game_probs[i],game_value);
    }
}

ChessGame::ChessGame(shared_ptr<ChessAgent> w, shared_ptr<ChessAgent> b, ostream& log, bool verbose) :
    log(log){
    
    this->w = w;
    this->b = b;
    this->verbose = verbose;
}

void ChessGame::play(){
    if(verbose){
        log << GameState() << endl;
    }

    move_vector move;
    while(true){
        
        // apply white's move:
        if(!w->prompt_next_move(move, log, verbose)){
            break;
        }
        w->apply_move(move, log,verbose);
        b->apply_move(move, log, verbose);

        // apply black's move:
        if(!b->prompt_next_move(move, log, verbose)){
            break;
        }
        w->apply_move(move, log,verbose);
        b->apply_move(move,log,verbose);
    }

    w->end_of_game_callback(log,verbose);
    b->end_of_game_callback(log,verbose);
}

bool load_chessnet_dataset(chessnet_dataset& data, string path){
    
    ifstream file_in(path, ios::binary);
    if(!file_in){
        cerr << "Error: unable to open \"" + path + "\"." << endl;
        return false;
    } else {
        auto archive_in = cereal::PortableBinaryInputArchive(file_in);
        archive_in(data);
    }

    file_in.close();
    return true;
}

bool save_chessnet_dataset(chessnet_dataset& data, string path){
    
    ofstream file_out(path, ios::binary);
    if(!file_out){
        cerr << "Error: unable to open \"" + path + "\"." << endl;
        return false;
    } else {
        auto archive_out = cereal::PortableBinaryOutputArchive(file_out);
        archive_out(data);
    }

    file_out.close();
    return true;
}

void print_info(chessnet_dataset& data, ostream& os){
    os << "Dataset (" << data.size() << " items):" << endl;
    for(auto item : data){
        auto [ board, moves, value] = item;
        cout << "value: " << value << "  ";
        double min_prob, max_prob = moves[0];
        for(auto m : moves){
            if(m < min_prob){ min_prob = m; }
            if(m > max_prob){ max_prob = m; }
        }
        cout << "  Min prob: "  << min_prob
             << "  Max Prob: " << max_prob << endl;
    }
}

ChessNetSelfPlay::ChessNetSelfPlay(string model_path, 
                        unsigned int batch_size, 
                        unsigned int sims_per_move, 
                        double validation_holdout) : 
                        old_model(model_path), new_model(model_path){

    this->model_path = model_path;
    this->batch_size = batch_size;
    this->sims_per_move = sims_per_move;
    this->validation_holdout = validation_holdout;

    this->new_model = cppflow::model(model_path);
    this->old_model = cppflow::model(model_path);
}

double ChessNetSelfPlay::do_self_play_episode(unsigned int n_games, 
            chessnet_dataset& training_data, ostream& log, bool verbose){

    unsigned int new_wins = 0;
    bool new_playing_as_white = false;

    // randomly assign black/white players:
    shared_ptr<ChessNetAgent> b, w;
    if(rand() & 1){
        w = make_shared<ChessNetAgent>(WHITE, old_model);
        b = make_shared<ChessNetAgent>(BLACK, new_model);
    } else {
        w = make_shared<ChessNetAgent>(WHITE, new_model);
        b = make_shared<ChessNetAgent>(BLACK, old_model);
        new_playing_as_white = true;
    }

    for(unsigned int n = 0; n < n_games; ++n){

        // play a game:
        ChessGame game = ChessGame(w,b,log,verbose);
        game.play();
        w->get_training_data(training_data);

        // record number of wins by new network:
        if((w->get_game_value() > 0.0) && new_playing_as_white){
            ++new_wins;
        } else if((w->get_game_value() < 0.0) && (!new_playing_as_white)){
            ++new_wins;
        }
        
        w->reset_agent(log, verbose);
        b->reset_agent(log, verbose);
    }

    w->clear_agent_cache(log, verbose);
    b->clear_agent_cache(log, verbose);

    if(verbose){
        log << "# of training examples: " << training_data.size() << endl;
    }
    
    return static_cast<double>(new_wins) / static_cast<double>(n_games);
}

double ChessNetSelfPlay::do_training_steps(unsigned int n_epochs, 
            chessnet_dataset& training_data, 
            unsigned int seed, 
            ostream& log, 
            bool verbose, bool reset_optimizer){
    
    double final_loss = 0.0;

    // reset optimizer (optional):
    if(reset_optimizer){
        new_model({{RESET_OPTIMIZER_OPTIONS_INPUT, 
                    cppflow::tensor(std::string(""))}},
                  {RESET_OPTIMIZER_OPTIONS_OUTPUT});
    }

    // shuffle data:
    auto data_idxs = vector<unsigned int>(training_data.size());
    for(unsigned int i = 0; i < training_data.size(); ++i){
        data_idxs[i] = i;
    }
    shuffle(data_idxs.begin(), data_idxs.end(), default_random_engine(seed));
    
    // initialize train/validation tensors:
    vector<cppflow::tensor> x_train_batches, 
                            y_pi_train_batches,
                            y_v_train_batches,
                            x_test_batches,
                            y_pi_test_batches,
                            y_v_test_batches;

    unsigned int split_idx = static_cast<unsigned int>(
        data_idxs.size()*validation_holdout
    );

    // pack data into train/validation tensors:
    for(unsigned int i = 0; i + batch_size < data_idxs.size(); i += batch_size){

        // pack tensors in batches:
        auto batch_x = vector<float>(batch_size*8*8*6, 0.0f); 
        auto batch_y_pi = vector<float>(batch_size*64*64);
        auto batch_y_v = vector<float>(batch_size);

        for(unsigned int j = 0; j < batch_size; ++j){
            assert(i+j < data_idxs.size());
            unsigned int data_idx = data_idxs[i+j];

            // retrieve data element tuple: (board, pi_probs, value)
            auto [elem_board, elem_probs, elem_value] = training_data[data_idx];
            
            // pack x tensor: [batch size,8,8,6]
            for(unsigned int k = 0; k < 64; ++k){
                piece p = elem_board[k];
                if(p){
                    int p_idx = (p>>1)-1;
                    assert(0 <= p_idx && p_idx < 6);
                    batch_x[(j*8*8*6) + k*6+p_idx] = ((is_white(p))? 1.0f : -1.0f);
                }
            }

            // pack y_pi tensor: [batch size, 64*64]
            for(unsigned int k = 0; k < 64*64; ++k){
                if(isnan(elem_probs[k])){
                    batch_y_pi[(j*64*64) + k] = 0.0;
                } else {
                    batch_y_pi[(j*64*64) + k] = elem_probs[k];
                }
            }

            // pack y_v tensor: [batch size]
            batch_y_v[j]= elem_value;
        }

        // cast cpp vectors to tensors:
        auto batch_x_tensor = cppflow::tensor(batch_x, {batch_size, 8,8,6});
        auto batch_y_pi_tensor = cppflow::tensor(batch_y_pi, {batch_size, 64*64});
        auto batch_y_v_tensor = cppflow::tensor(batch_y_v, {batch_size});

        // add tensors to dataset (train or test):        
        if(i < split_idx){
            x_test_batches.push_back(batch_x_tensor);
            y_pi_test_batches.push_back(batch_y_pi_tensor);
            y_v_test_batches.push_back(batch_y_v_tensor);
        } else {
            x_train_batches.push_back(batch_x_tensor);
            y_pi_train_batches.push_back(batch_y_pi_tensor);
            y_v_train_batches.push_back(batch_y_v_tensor);
        }
    }
    
    
    // perform training loop:
    unsigned int n_train_batches = x_train_batches.size();
    unsigned int n_test_batches = x_test_batches.size();
    for(unsigned int n = 0; n < n_epochs; ++n){

        if(verbose){
            log << "------------------------------------------------------------" << endl;
            log << "Epoch " << (n+1) << " of " 
                << n_epochs << ":" << endl;
            log << setw(12) << "step"
            << setw(16) << "v loss"
            << setw(16) << "pi loss"
            << setw(16) << "net reg. loss"
            << endl;
        }

        // perform epoch on training data:
        double mean_v_loss = 0.0, mean_pi_loss = 0.0, mean_total_loss = 0.0;
        for(unsigned int i = 0; i < n_train_batches; ++i){
            auto batch_loss = new_model({{TRAIN_X_INPUT, x_train_batches[i]},
                                    {TRAIN_Y_PI_INPUT, y_pi_train_batches[i]},
                                    {TRAIN_Y_V_INPUT, y_v_train_batches[i]}},
                                    {TRAIN_V_LOSS_OUTPUT,
                                     TRAIN_PI_LOSS_OUTPUT,
                                     TRAIN_TOTAL_LOSS_OUTPUT});
            auto v_loss_vec = cppflow::cast(batch_loss[0],TF_FLOAT,TF_DOUBLE).get_data<double>();
            auto pi_loss_vec = cppflow::cast(batch_loss[1],TF_FLOAT, TF_DOUBLE).get_data<double>();
            auto total_loss_vec = cppflow::cast(batch_loss[2],TF_FLOAT,TF_DOUBLE).get_data<double>();

            mean_v_loss += v_loss_vec[0];
            mean_pi_loss += pi_loss_vec[0];
            mean_total_loss += total_loss_vec[0];
        }
        mean_v_loss /= n_train_batches;
        mean_pi_loss /= n_train_batches;
        mean_total_loss /= n_train_batches;
        
        // print training loss:
        if(verbose){
            log << setw(12) << "TRAIN"
             << setw(16) << mean_v_loss
             << setw(16) << mean_pi_loss 
             << setw(16) << mean_total_loss
             << endl;
        }

        // perform validation epoch:
        mean_v_loss = 0.0; 
        mean_pi_loss = 0.0; 
        mean_total_loss = 0.0;
        for(unsigned int i = 0; i < n_test_batches; ++i){
            auto batch_loss = new_model({{VALIDATE_X_INPUT, x_test_batches[i]},
                                    {VALIDATE_Y_PI_INPUT, y_pi_test_batches[i]},
                                    {VALIDATE_Y_V_INPUT, y_v_test_batches[i]}},
                                    {VALIDATE_V_LOSS_OUTPUT,
                                     VALIDATE_PI_LOSS_OUTPUT,
                                     VALIDATE_TOTAL_LOSS_OUTPUT});
            auto v_loss_vec = cppflow::cast(batch_loss[0],TF_FLOAT,TF_DOUBLE).get_data<double>();
            auto pi_loss_vec = cppflow::cast(batch_loss[1],TF_FLOAT, TF_DOUBLE).get_data<double>();
            auto total_loss_vec = cppflow::cast(batch_loss[2],TF_FLOAT,TF_DOUBLE).get_data<double>();
            
            
            mean_v_loss += v_loss_vec[0];
            mean_pi_loss += pi_loss_vec[0];
            mean_total_loss += total_loss_vec[0];
        }
        
        mean_v_loss /= n_test_batches;
        mean_pi_loss /= n_test_batches;
        mean_total_loss /= n_test_batches;
        final_loss = mean_total_loss;

        // print validation loss:
        if(verbose){
            log << setw(12) << "VALIDATION"
                << setw(16) << mean_v_loss
                << setw(16) << mean_pi_loss 
                << setw(16) << mean_total_loss
                << endl;
        }
    }

    return final_loss;
}

void ChessNetSelfPlay::save_model(){
    // save weights to override existing weights:
    auto path_in = cppflow::tensor(std::string(model_path));
    new_model({{SAVE_MODEL_PATH_INPUT, path_in}},{SAVE_MODEL_PATH_OUTPUT});

    // re-load saved the old model as the recently saved model
    this->old_model = cppflow::model(model_path);
}

void ChessNetSelfPlay::export_model(string path){
    auto path_in = cppflow::tensor(std::string(path));
    new_model({{SAVE_MODEL_PATH_INPUT, path_in}},{SAVE_MODEL_PATH_OUTPUT});
}