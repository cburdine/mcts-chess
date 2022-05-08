#include <iostream>

#include "chess_mcts.h"
#include "chess_game_logic.h"
#include "chess_game_state.h"
#include "cppflow/ops.h"
#include "cppflow/model.h"

ChessUniformMCTS::ChessUniformMCTS(
    GameState gs, color player_to_move, double noise) : MCTS(gs) {
    
    this->player_to_move = player_to_move;
    this->prev_moves_since_last_capture = vector<unsigned int>();
    this->moves_since_last_capture = 0;
    this->noise = noise;
}

bool ChessUniformMCTS::get_state_actions(vector<move_vector>& actions){
    // (loosely) enforce 50-move rule:
    if(moves_since_last_capture >= 50){
        return false;
    }

    // return the valid player moves:
    if(player_to_move == WHITE){
        actions = get_valid_moves(state, WHITE);
    } else {
        assert(player_to_move == BLACK);
        actions = get_valid_moves(state,BLACK);
    }

    // check if the state is a terminal state:
    if(state.state & (W_CHECKMATE | B_CHECKMATE | DRAW)){
        assert(actions.size() == 0);
        return false;
    }

    return true;
}

double ChessUniformMCTS::get_state_action_estimates(vector<move_vector>& actions, vector<double>& prob_estimates){
    
    // ensure actions is nonempty:
    assert(actions.size() > 0);

    // generate uniform state action probability estimates:
    double unif_prob = 1.0 / static_cast<double>(actions.size());
    prob_estimates = vector<double>(actions.size(), unif_prob);

    // return value estimate of 0.0 (since this is not a terminal state):
    return 0.0;
}
    
void ChessUniformMCTS::apply_state_action(move_vector d){
    apply_move(state, d);

    if(captured_piece(d) || is_pawn(state.board[(src_y(d)<<3) | src_x(d)])){
        prev_moves_since_last_capture.push_back(moves_since_last_capture);
        moves_since_last_capture = 0;
    } else {
        moves_since_last_capture += 1;
    }

    player_to_move = !player_to_move;
}

void ChessUniformMCTS::undo_state_action(move_vector d){
    undo_move(state,d);
    
    if(moves_since_last_capture <= 0){
        assert(prev_moves_since_last_capture.size() >= 1);
        assert(captured_piece(d) || promoted_piece(d) || is_pawn(state.board[(dest_y(d)<<3) | dest_x(d)]));
        moves_since_last_capture = prev_moves_since_last_capture.back();
        prev_moves_since_last_capture.pop_back();
    } else {
        moves_since_last_capture -= 1;
        assert(moves_since_last_capture >= 0);
    }

    player_to_move = !player_to_move;
}

double ChessUniformMCTS::get_final_state_value(){

    auto moves = get_valid_moves(state, player_to_move);
    double value = 0.0;
    
    if(state.state & W_CHECKMATE){ value = -1.0; }
    if(state.state & B_CHECKMATE){ value =  1.0; }

    return value;
}

size_t ChessUniformMCTS::hash_state(){
    
    size_t h = 0;
    h ^= std::hash<int>{}(state.state | DRAW | W_CHECKMATE | B_CHECKMATE)
          + 0x9e3779b9 + (h << 6) + (h >> 2);

    // Apply the boost array hash:
    //    http://www.boost.org/doc/libs/1_35_0/doc/html/boost/hash_combine_id241013.html
    for (auto p : state.board){
        h ^= std::hash<int>{}(p)  + 0x9e3779b9 + (h << 6) + (h >> 2); 
    }
    h ^= std::hash<int>{}(31*player_to_move)  + 0x9e3779b9 + (h << 6) + (h >> 2);
    h ^= std::hash<int>{}(31*moves_since_last_capture)  + 0x9e3779b9 + (h << 6) + (h >> 2);
    
    /*
    size_t h = (state.state | DRAW | W_CHECKMATE | B_CHECKMATE);
    h = (h<<1) | player_to_move;
    h = h*31 + moves_since_last_capture;

    for(auto p : state.board){
        h = h*31 + p;
    }
    */
    
    return h;
}

double ChessUniformMCTS::action_objective_function(MCTSNode& node, int action_idx){
    
    // maximize the Q Upper Confidence Bound (UCB) value:
    double q_factor = (player_to_move == WHITE)? 1.0 : -1.0;
    return q_factor*node.action_q_values[action_idx] + 
        noise * node.prior[action_idx] * sqrt(static_cast<double>(node.visit_count)) / 
        static_cast<double>(node.action_counts[action_idx] + 1);
}

void ChessUniformMCTS::reset_to_state(GameState gs, color player_to_move){
    
    search_path.clear();
    search_path_indices.clear();

    this->player_to_move = player_to_move;
    this->state = gs;

    moves_since_last_capture = 0;
    prev_moves_since_last_capture.clear();

}

ChessNetMCTS::ChessNetMCTS(GameState gs, string model_path, color player_to_move, double noise) : 
    ChessUniformMCTS(gs,player_to_move,noise), nnet(model_path){
    // constructor
}

ChessNetMCTS::ChessNetMCTS(GameState gs, cppflow::model model, color player_to_move, double noise) : 
    ChessUniformMCTS(gs,player_to_move,noise), nnet(model){
    // constructor
}

double ChessNetMCTS::get_state_action_estimates(vector<move_vector>& actions, vector<double>& prob_estimates){
    
    // ensure actions is nonempty:
    assert(actions.size() > 0);
    
    // fill in board tensor (8x8x6):
    auto input = vector<float>(8*8*6, 0.0f);    
    for(unsigned int i = 0; i < 64; ++i){
        piece p = state.board[i];
        if(p){
            int p_idx = (p>>1)-1;
            assert(0 <= p_idx && p_idx < 6);
            input[6*i+p_idx] = ((is_white(p))? 1.0f : -1.0f);
        }
    }

    // reshape input to correct board size:
    auto x_input = cppflow::tensor(input,{1,8,8,6});

    // perform inference:
    auto output = nnet({{serve_x_input, x_input}},{serve_pi_output, serve_v_output});
    
    // retrieve model output:
    vector<double> output_prob_estimates = cppflow::cast(cppflow::squeeze(output[0],{0}),TF_FLOAT,TF_DOUBLE).get_data<double>();
    double output_value = cppflow::cast(output[0],TF_FLOAT, TF_DOUBLE).get_data<double>().front();
    assert(-1.0 <= output_value);
    assert( 1.0 >= output_value);

    // mask model output with valid moves:
    prob_estimates.clear();
    double prob_sum = 0.0;
    for(auto &a : actions){
        unsigned int idx = (src_y(a)<<9) | (src_x(a)<<6) | (dest_y(a)<<3) | dest_x(a);
        assert(idx < output_prob_estimates.size());
        double prob = output_prob_estimates[idx];
        assert(prob >= 0.0);
        prob_sum += prob;
        prob_estimates.push_back(prob);
    }

    //re-normalize probabilities:
    for(double &p : prob_estimates){
        if(prob_sum > 0){
            p /= prob_sum;
        } else {
            p = 1.0 / prob_estimates.size();
        }
    }

    // return estimated value:
    return output_value;
}