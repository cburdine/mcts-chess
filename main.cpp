#include <iostream>
#include <vector>
#include <fstream>

#include "chess/game_state.h"
#include "chess/game_logic.h"
#include "chess_mcts.h"
#include "chess_game.h"
#include <stdlib.h>
#include <time.h>
#include <memory>

using namespace std;

int main(){
    
    srand(time(0));

    auto game = ChessGame(
              make_unique<ChessNetAgent>(WHITE, "./jupyter/simple_chess_net"), 
              make_unique<ChessNetAgent>(BLACK, "./jupyter/simple_chess_net"));
    
    game.play();

    /*

    auto game = ChessGame(
              make_unique<ChessPlayerAgent>(WHITE, cin), 
              make_unique<ChessNetAgent>(BLACK, "./jupyter/simple_chess_net"));
    game.play();
    */

    

    return 0;
}


