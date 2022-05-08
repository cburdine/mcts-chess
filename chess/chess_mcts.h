#ifndef CHESS_MCTS_H
#define CHESS_MCTS_H

#include <cassert>
#include <vector>
#include <string>

#include "mcts/mcts.h"
#include "chess_game_logic.h"
#include "chess_game_state.h"
#include "cppflow/ops.h"
#include "cppflow/model.h"
#include "chessnet_config.h"

class ChessUniformMCTS : public MCTS<GameState,move_vector> {
protected:

    color player_to_move;
    double noise;
    unsigned int moves_since_last_capture;
    vector<unsigned int> prev_moves_since_last_capture;

public:

    ChessUniformMCTS(GameState gs, color player_to_move=WHITE, double noise=1.0);

    bool get_state_actions(vector<move_vector>& actions);

    double get_state_action_estimates(vector<move_vector>& actions, vector<double>& prob_estimates);
    
    void apply_state_action(move_vector d);
    
    void undo_state_action(move_vector d);

    double get_final_state_value();

    size_t hash_state();

    double action_objective_function(MCTSNode& node, int action_idx);

    void reset_to_state(GameState gs, color player_to_move=WHITE);

    unsigned int get_moves_since_last_capture(){ return moves_since_last_capture; }
    color get_player_to_move(){ return player_to_move; }
};

class ChessNetMCTS : public ChessUniformMCTS {
protected:
    
    cppflow::model nnet;

    const string serve_x_input = SERVE_X_INPUT;
    const string serve_pi_output = SERVE_PI_OUTPUT;
    const string serve_v_output = SERVE_V_OUTPUT;

public:

    ChessNetMCTS(GameState gs, string model_path, color player_to_move = WHITE, double noise = 1.0);
    ChessNetMCTS(GameState gs, cppflow::model model, color player_to_move = WHITE, double noise = 1.0);


    double get_state_action_estimates(vector<move_vector>& actions, vector<double>& prob_estimates);

};

#endif /* CHESS_MCTS_H */