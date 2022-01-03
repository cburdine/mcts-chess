#ifndef CHESS_GAME_H
#define CHESS_GAME_H

#include "chess_mcts.h"
#include "chess/game_logic.h"
#include "chess/game_state.h"
#include <chrono>
#include <random>

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

class ChessNetAgent : public ChessAgent {
private:
    ChessNetMCTS nnet_mcts;
    unsigned int sims_per_move;
    default_random_engine rng_engine;
    uniform_real_distribution<double> random_prob;

    vector<array<piece,64>> game_boards;
    vector<array<double,64*64>> game_probs;
    double game_value;

public:
    ChessNetAgent(color agent_color, string model_path, unsigned int sims_per_move=256);

    bool prompt_next_move(move_vector& move, ostream& log, bool verbose = false);

    void apply_move(move_vector& move, ostream& log, bool verbose = false);

    void end_of_game_callback(ostream& log, bool verbose = false);

    void reset_agent(ostream& log, bool verbose = false);

};

class ChessGame {
protected:

    bool verbose;
    ostream& log;
    shared_ptr<ChessAgent> w, b;
    chrono::duration<double> w_time_elapsed, b_time_elapsed;

public:

    ChessGame(shared_ptr<ChessAgent> w, shared_ptr<ChessAgent> b, ostream& log = cout, bool verbose = true);

    void play();
};



#endif /* CHESS_GAME_H */