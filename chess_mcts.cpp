#include "chess_mcts.h"
#include "chess/game_logic.h"
#include <iostream>

ChessUniformMCTS::ChessUniformMCTS(
    GameState gs, color player_to_move) : MCTS(gs) {
    
    this->player_to_move = player_to_move;
    this->prev_moves_since_last_capture = vector<unsigned int>();
    this->moves_since_last_capture = 0;
}

bool ChessUniformMCTS::get_state_action_values(
    vector<move_vector>& actions, vector<double>& probs, double& value){
    
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

    double unif_prob = 1.0 / static_cast<double>(actions.size());
    probs = vector<double>(actions.size(), unif_prob);
    value = 0.0;
    return true;
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
    
    if(state.state & W_CHECKMATE){ value = 1.0; }
    if(state.state & B_CHECKMATE){ value = -1.0; }

    //cout << "Final State: " << endl;
    //cout << state << endl;
    //cout << to_statestring(state.state) << endl;
    //cout << "Value: " << value << endl;

    return value;
}

size_t ChessUniformMCTS::hash_state(GameState& s){

    size_t h = 31*(state.state | DRAW | W_CHECKMATE | B_CHECKMATE);

    // Apply the boost array hash:
    //    http://www.boost.org/doc/libs/1_35_0/doc/html/boost/hash_combine_id241013.html
    for (auto p : state.board){
        h ^= std::hash<int>{}(p)  + 0x9e3779b9 + (h << 6) + (h >> 2); 
    }
    h ^= std::hash<int>{}(31*player_to_move)  + 0x9e3779b9 + (h << 6) + (h >> 2);

    return h;
}