#include <iostream>
#include "chess/game_state.h"
#include "chess/game_logic.h"
#include "mcts/mcts.h"

using namespace std;

int main(){

    cout << "Default game state:" << endl;
    
    MCTS<int,int> test();

    GameState gs = GameState();

    cout <<  gs << endl;    
    

    auto white_moves = get_valid_moves(gs, WHITE);
    cout << "WHITE MOVES" << endl;
    for(auto m : white_moves){
        cout << to_movestring(gs, m) << endl;
    }
    
    return 0;
}


