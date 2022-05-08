#include <iostream>
#include <vector>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include <memory>

#include "chess/chess_game_state.h"
#include "chess/chess_game_logic.h"
#include "chess/chess_mcts.h"
#include "chess/chess_game.h"

using namespace std;

int main(){
    
    srand(time(0));

    chessnet_dataset dataset;
    ChessNetSelfPlay self_play_instance = ChessNetSelfPlay("./jupyter/simple_chess_net");
    //self_play_instance.do_self_play_episode(1, dataset, cout, true);

    //save_chessnet_dataset(dataset, "chessnet_data.mcts");

    dataset.clear();
    load_chessnet_dataset(dataset, "chessnet_data.mcts");
    print_info(dataset, cout);

    self_play_instance.do_training_steps(100, dataset, 12345, cout, true);

    /*
    // have the nnet play against itself:;
    auto game = ChessGame(
              make_unique<ChessNetAgent>(WHITE, "./jupyter/simple_chess_net"), 
              make_unique<ChessNetAgent>(BLACK, "./jupyter/simple_chess_net"));
    game.play();
    */
   
    /*
    // have a player (white) play against the nnet:
    auto game = ChessGame(
              make_unique<ChessPlayerAgent>(WHITE, cin), 
              make_unique<ChessNetAgent>(BLACK, "./jupyter/simple_chess_net"));
    game.play();
    */

    

    return 0;
}


