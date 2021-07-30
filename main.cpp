#include <iostream>
#include "chess/game_state.h"

using namespace std;

int main(){

    cout << "Default game state:" << endl;
    
    GameState gs = GameState();

    cout <<  gs << endl;
    cout << to_statestring(gs.state) << endl;
    
    return 0;
}


