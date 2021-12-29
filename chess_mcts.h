#ifndef CHESS_MCTS_H
#define CHESS_MCTS_H

#include "mcts/mcts.h"
#include <cassert>
#include "chess/game_logic.h"
#include "chess/game_state.h"
#include <vector>
#include <map>

class ChessUniformMCTS : public MCTS<GameState,move_vector> {
protected:

    color player_to_move;
    unsigned int moves_since_last_capture;
    vector<unsigned int> prev_moves_since_last_capture;

public:

    ChessUniformMCTS(GameState gs, color player_to_move=WHITE);

    bool get_state_action_values(vector<move_vector>& actions, 
                                         vector<double>& probs, double& value);
    
    void apply_state_action(move_vector d);
    
    void undo_state_action(move_vector d);

    double get_final_state_value();

    size_t hash_state(GameState& s);
};

#endif /* CHESS_MCTS_H */