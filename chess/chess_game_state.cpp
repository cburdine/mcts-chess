#include <array>
#include <sstream>
#include <iostream>
#include <cassert>

#include "chess_game_state.h"
#include "chess_game_logic.h"

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

    // initialize king position vector:
    king_pos = 0;
    set_w_king_pos(king_pos, 4, 0);
    set_b_king_pos(king_pos, 4, 7);
}

ostream& operator<<(ostream& os, GameState const& s){
    for (int y = 7; y >= 0; --y){
        os << (y+1);
        for(int x = 0; x < 8; ++x){
            piece p = s.get_piece(x,y);
            if(p != NONE){ 
                os << ' ' << to_display_char(p); 
            } else {
                os << ' ' << (((x+y)&1)? '.' : '#');
            }
        }
        os << endl;
    }
    os << ' ';
    for(int x = 0; x < 8; ++x){ os << ' ' << (char) ('a'+x); }
    return os;
}

bool operator==(const GameState& lhs, const GameState& rhs){
    return (lhs.board == rhs.board 
         && lhs.king_pos == rhs.king_pos 
         && lhs.state == rhs.state );
}


string to_statestring(data_vector s){
    stringstream ss;
    ss << "------White------" << endl
       << "can_rcastle: " << (bool) w_can_rcastle(s) << endl
       << "can_lcastle: " << (bool) w_can_lcastle(s) << endl
       << "check: " << (bool) w_check(s) << endl
       << "checkmate: " << (bool) w_checkmate(s) << endl
       << "draw: " << (bool) draw(s) << endl
       << "en_passant: ";
    if(w_en_passant(s)){ ss << w_en_passant_x(s); }
    else{ assert(w_en_passant_x(s) == 0); }
    ss << endl;

    ss << "------Black------" << endl
       << "can_rcastle: " << (bool) b_can_rcastle(s) << endl
       << "can_lcastle: " << (bool) b_can_lcastle(s) << endl
       << "check: " << (bool) b_check(s) << endl
       << "checkmate: " << (bool) b_checkmate(s) << endl
       << "draw: " << (bool) draw(s) << endl
       << "en_passant: ";
    if(b_en_passant(s)){ ss << b_en_passant_x(s); }
    else{ assert(b_en_passant_x(s) == 0); }
    ss << endl;

    return ss.str();
}
