#include <iostream>
#include <vector>
#include <fstream>

#include "chess/game_state.h"
#include "chess/game_logic.h"
#include "chess_mcts.h"
#include <stdlib.h>
#include <time.h>

using namespace std;

int main(){

    /* for(int t = 1000; t < 10000; ++t){

    int seed = t;
    cout << "seed: " << seed << endl;
    srand(seed);
    
    ofstream of = ofstream("game.txt");

    MCTS<int,int> test();

    */

    GameState gs = GameState();

    auto mcts = ChessUniformMCTS(gs, WHITE);
    cout << gs << endl;

    mcts.run(10000);

    /*
    vector<move_vector> move_history = vector<move_vector>();
    vector<GameState> state_history = vector<GameState>();

    of <<  gs << endl;
    for(int i = 0; i < 1000; ++i){

        auto moves = (i&1)? get_valid_moves(gs,BLACK) : get_valid_moves(gs, WHITE);

        if(moves.empty()){ 
            if(draw(gs.state)){ of << "DRAW"; }
            else if(w_checkmate(gs.state)){ of << "WHITE CHECKMATED"; }
            else if(b_checkmate(gs.state)){ of << "BLACK CHECKMATED"; }
            else{ assert(false && "no status returned!");}
            of << endl << flush;
            break;
        }

        auto m = moves.at(rand() % moves.size());
        of << ((i&1)? "BLACK: " : "WHITE: ") << to_movestring(gs, m) << endl << flush;
        of << gs << endl;

        state_history.push_back(gs);
        move_history.push_back(m);
        
        apply_move(gs, m);
        assert(!draw(gs.state));
    }

    // unwind move stack:
    while(!move_history.empty()){
        GameState  target_gs = state_history.back();
        move_vector m = move_history.back();
        undo_move(gs, m);

        of << to_move_vector_string(m) << endl;
        //of << to_movestring(gs, m) << endl;
        of << "STATE:" << endl << gs << endl 
             << to_statestring(gs.state) << endl;
        of << "TARGET:" << endl << target_gs << endl
             << to_statestring(target_gs.state) << endl;

        assert(gs.board == target_gs.board);
        assert(gs.king_pos == target_gs.king_pos);
        if(gs.state != target_gs.state){
            of << hex << (gs.state ^ target_gs.state) << endl;
        }
        assert(gs.state == target_gs.state);
        assert(gs == target_gs);

        state_history.pop_back();
        move_history.pop_back();
    }
    assert(move_history.empty());
    assert(state_history.empty());

    }
    */

    return 0;
}


