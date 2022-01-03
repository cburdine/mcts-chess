#include "chess_game.h"

#include <string>
#include <vector>

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
        if(final_state | B_CHECKMATE){
            log << "Black checkmate. White wins." << endl;
        } else if(final_state | W_CHECKMATE){
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
    string move_str = to_movestring(nnet_mcts.get_state(),move);
    nnet_mcts.apply_state_action(move);
    if(verbose){
        log << move_str << endl;
        log << nnet_mcts.get_state() << endl;
    }
}

void ChessNetAgent::end_of_game_callback(ostream& log, bool verbose){
    // TODO: add a training callback for ChessNetAgent
}

void ChessNetAgent::reset_agent(ostream& log, bool verbose){
    nnet_mcts.clear_cache();
    nnet_mcts.reset_to_state(GameState());
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