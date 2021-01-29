#include <iostream>
#include "game_state.h"

using namespace std;

int main(){

    cout << "Default game state:" << endl;
    
    GameState state = GameState();

    cout <<  state << endl;
    
    return 0;
}


