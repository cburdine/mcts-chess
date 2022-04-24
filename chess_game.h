#ifndef CHESS_GAME_H
#define CHESS_GAME_H

#include "chess_mcts.h"
#include "chess/game_logic.h"
#include "chess/game_state.h"
#include <chrono>
#include <random>
#include <tuple>

class ChessAgent {
protected:
    color agent_color;

public:

    ChessAgent(color agent_color){ this->agent_color = agent_color; }

    virtual bool prompt_next_move(move_vector& move, ostream& log, bool verbose = false) = 0;
    
    virtual void apply_move(move_vector& move, ostream& log, bool verbose = false) = 0;

    virtual void end_of_game_callback(ostream& log, bool verbose = false) = 0;

    virtual void reset_agent(ostream& log, bool verbose = false) = 0;
};

class ChessPlayerAgent : public ChessAgent {
private:
    istream& input;
    ChessUniformMCTS player_mcts;

public:
    ChessPlayerAgent(color agent_color, istream& player_input);

    bool prompt_next_move(move_vector& move, ostream& log, bool verbose = false);

    void apply_move(move_vector& move, ostream& log, bool verbose = false);

    void end_of_game_callback(ostream& log, bool verbose = false);

    void reset_agent(ostream& log, bool verbose = false);

};

typedef vector<tuple<array<piece,64>,array<double,64*64>,double>> chessnet_dataset;

class ChessNetAgent : public ChessAgent {
private:
    ChessNetMCTS nnet_mcts;
    unsigned int sims_per_move;
    default_random_engine rng_engine;
    uniform_real_distribution<double> random_prob;

    vector<array<piece,64>> game_boards;
    vector<array<double,64*64>> game_probs;
    vector<move_vector> game_moves;
    double game_value;

public:
    ChessNetAgent(color agent_color, string model_path, unsigned int sims_per_move=256);
    ChessNetAgent(color agent_color, cppflow::model& model, unsigned int sims_per_move=256);

    bool prompt_next_move(move_vector& move, ostream& log, bool verbose = false);

    void apply_move(move_vector& move, ostream& log, bool verbose = false);

    void end_of_game_callback(ostream& log, bool verbose = false);

    void reset_agent(ostream& log, bool verbose = false);

    void clear_agent_cache(ostream& log, bool verbose);

    void get_training_data(chessnet_dataset& dataset);

    double get_game_value(){ return game_value; }

};

class ChessGame {
protected:

    bool verbose;
    ostream& log;
    shared_ptr<ChessAgent> w, b;

    // TODO: implement a move prompt timing system:
    chrono::duration<double> w_time_elapsed, b_time_elapsed;

public:

    ChessGame(shared_ptr<ChessAgent> w, shared_ptr<ChessAgent> b, ostream& log = cout, bool verbose = true);

    void play();
};

class ChessNetSelfPlay {
protected:

    string model_path;
    unsigned int batch_size;
    unsigned int sims_per_move;
    double validation_holdout;

    vector<array<piece,64>> board_data;
    vector<array<double,64*64>> prob_data;
    vector<double> value_data;

    cppflow::model old_model;
    cppflow::model new_model;

public:

    ChessNetSelfPlay(string model_path, 
                        unsigned int batch_size = 4, 
                        unsigned int sims_per_move = 256, 
                        double validation_holdout = 0.1);

    double do_self_play_episode(unsigned int n_games, ostream& log, bool verbose = false);

    void clear_data();

    double do_training_steps(unsigned int n_epochs, unsigned int seed, ostream& log, bool verbose = false);
};



#endif /* CHESS_GAME_H */