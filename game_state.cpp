#include "game_state.h"
#include <array>
#include <iostream>

GameState::GameState(){

    const piece B_ROW[8] = {
        B_ROOK, B_KNIGHT, B_BISHOP, B_QUEEN, B_KING, B_BISHOP, B_KNIGHT, B_ROOK
    };

    const piece W_ROW[8] = {
        W_ROOK, W_KNIGHT, W_BISHOP, W_QUEEN, W_KING, W_BISHOP, W_KNIGHT, W_ROOK
    };
    
    // place pieces:
    for(int i = 0; i < 8; ++i){
        set_piece(i,0,W_ROW[i]);
        set_piece(i,1,W_PAWN);
        for(int j = 2; j <= 5; ++j){
            set_piece(i,j,NONE);
        }
        set_piece(i,6,B_PAWN);
        set_piece(i,7,B_ROW[i]);
    }

    // initialize state data vector:
    state = W_CAN_LCASTLE | W_CAN_RCASTLE | B_CAN_LCASTLE | B_CAN_RCASTLE;
}

ostream& operator<<(ostream& os, GameState const& s){
    for (int y = 7; y >= 0; --y){
        os << (y+1);
        for(int x = 0; x < 8; ++x){
            piece p = s.get_piece(x,y);
            if(p != NONE){ 
                os << ' ' << p; 
            } else { 
                os << ' ' << (((x+y)&1)? '#' : '.');
            }
        }
        os << endl;
    }
    os << ' ';
    for(int x = 0; x < 8; ++x){ os << ' ' << (char) ('a'+x); }
    return os;
}
