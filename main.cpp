#include <iostream>
#include "chess/game_state.h"
#include "chess/game_logic.h"
#include "mcts/mcts.h"
#include <stdlib.h>
#include <time.h>

using namespace std;

int main(){

    cout << "Default game state:" << endl;
    
    MCTS<int,int> test();

    GameState gs = GameState();

    cout <<  gs << endl;    
    

    srand(time(NULL));
    for(int i = 0; i < 1000; ++i){
        auto moves = (i&1)? get_valid_moves(gs,BLACK) : get_valid_moves(gs, WHITE);
        if(moves.size() <= 0){ 
            if(draw(gs.state)){ cout << "DRAW"; }
            else if(w_checkmate(gs.state)){ cout << "WHITE CHECKMATED"; }
            else if(b_checkmate(gs.state)){ cout << "BLACK CHECKMATED"; }
            else{ assert(false && "no status returned!");}
            break;
        }
        auto m = moves.at(rand() % moves.size());
        cout << ((i&1)? "BLACK: " : "WHITE: ") << to_movestring(gs, m) << endl << flush;
        apply_move(gs, m);
        cout <<  gs << endl << flush;
    }
    
    return 0;
}


