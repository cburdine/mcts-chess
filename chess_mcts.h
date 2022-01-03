#ifndef CHESS_MCTS_H
#define CHESS_MCTS_H

#include "mcts/mcts.h"
#include "chess/game_logic.h"
#include "chess/game_state.h"
#include "cppflow/ops.h"
#include "cppflow/model.h"

#include <cassert>
#include <vector>
#include <string>


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
};

class ChessNetMCTS : public ChessUniformMCTS {
protected:

    cppflow::model nnet;

    const string serve_x_input = "chessnet_serve_x:0";
    const string serve_pi_output = "StatefulPartitionedCall:0";
    const string serve_v_output = "StatefulPartitionedCall:1";

    const string train_x_input = "chessnet_train_x:0";
    const string train_y_pi_input = "chessnet_train_pi:0";
    const string train_y_v_input = "chessnet_train_v:0";

    const string train_v_loss_output = "StatefulPartitionedCall_1:0";
    const string train_pi_loss_output = "StatefulPartitionedCall_1:1";
    const string total_loss_output = "StatefulPartitionedCall_1:2";

public:

    ChessNetMCTS(GameState gs, string model_path, color player_to_move = WHITE, double noise = 1.0);

    double get_state_action_estimates(vector<move_vector>& actions, vector<double>& prob_estimates);

};

#endif /* CHESS_MCTS_H */