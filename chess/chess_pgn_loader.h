#ifndef CHESS_PGN_LOADER_H
#define CHESS_PGN_LOADER_H

#include <fstream>

#include "chess_game.h"
#include "chess_game_state.h"

class PGNLoader {
private:
    string path;
    unsigned int size;
    ifstream pgn_in;

    bool seek_next_game();
    bool parse_game_moves(vector<string>& w_moves,
                          vector<string>& b_moves,
                          double& outcome);

    bool simulate_game(vector<string>& w_moves,
                       vector<string>& b_moves,
                       double& outcome,
                       chessnet_dataset& dataset);

    void add_move_data(GameState& gs, move_vector m, 
                       double outcome, 
                       chessnet_dataset& dataset);
public:
    PGNLoader(string path);
    ~PGNLoader(){ pgn_in.close(); }

    unsigned int get_size(){ return size; };

    unsigned int get_training_data(chessnet_dataset& dataset, 
                            int start_idx=0, int end_idx=0);
};
#endif /* CHESS_PGN_LOADER_H */