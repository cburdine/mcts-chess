#ifndef CHESS_GAME_STATE_H
#define CHESS_GAME_STATE_H

#include <iostream>
#include <array>
#include <vector>

using namespace std;

// game pieces:
enum piece {
    NONE = 0,
    W_PAWN   = 2,   B_PAWN   = 3, 
    W_ROOK   = 4,   B_ROOK   = 5,
    W_KNIGHT = 6,   B_KNIGHT = 7,
    W_BISHOP = 8,   B_BISHOP = 9,
    W_QUEEN  = 10,  B_QUEEN  = 11,
    W_KING   = 12,  B_KING   = 13,
};

typedef bool color;
const color WHITE = false;
const color BLACK = true;
inline bool get_color(piece p){ return (p&1); }

inline bool is_white(piece p){ return !(p&1); }
inline bool is_black(piece p){ return (p&1); }
inline bool is_pawn(piece p){ return ((p|1) == B_PAWN); }
inline bool is_rook(piece p){ return ((p|1) == B_ROOK); }
inline bool is_knight(piece p){ return ((p|1) == B_KNIGHT); }
inline bool is_bishop(piece p){ return ((p|1) == B_BISHOP); }
inline bool is_queen(piece p){ return ((p|1) == B_QUEEN); }
inline bool is_king(piece p){ return ((p|1) == B_KING); }

inline string to_char(piece p, bool shorthand=true){
    if(is_pawn(p)){ return (shorthand? "" : "P"); }
    if(is_rook(p)){ return "R"; }
    if(is_knight(p)){ return "N"; }
    if(is_bishop(p)){ return "B"; }
    if(is_queen(p)){ return "Q"; }
    if(is_king(p)){ return "K"; }
    return "?";
}

inline string to_display_char(piece p){
    switch(p){
        case W_PAWN:   return "\u2659";
        case W_ROOK:   return "\u2656";
        case W_KNIGHT: return "\u2658";
        case W_BISHOP: return "\u2657";
        case W_QUEEN:  return "\u2655";
        case W_KING:   return "\u2654";
        case B_PAWN:   return "\u265f";
        case B_ROOK:   return "\u265c";
        case B_KNIGHT: return "\u265e";
        case B_BISHOP: return "\u265d";
        case B_QUEEN:  return "\u265b";
        case B_KING:   return "\u265a";
        default: return "?";
    }
}

// data vector elements:
typedef int data_vector;

const int W_CAN_RCASTLE = (1<<0);
const int W_CAN_LCASTLE = (1<<1);
const int B_CAN_RCASTLE = (1<<2);
const int B_CAN_LCASTLE = (1<<3);
const int W_CHECK =       (1<<4);
const int B_CHECK =       (1<<5);
const int W_CHECKMATE =   (1<<6);
const int B_CHECKMATE =   (1<<7);
const int W_EN_PASSANT =  (1<<8);
const int B_EN_PASSANT =  (1<<12);
const int DRAW =          (1<<17);

inline bool w_can_rcastle(data_vector s){ return (W_CAN_RCASTLE & s); }
inline bool w_can_lcastle(data_vector s){ return (W_CAN_LCASTLE & s); }
inline bool b_can_rcastle(data_vector s){ return (B_CAN_RCASTLE & s); }
inline bool b_can_lcastle(data_vector s){ return (B_CAN_LCASTLE & s); }
inline bool w_check(data_vector s){ return (W_CHECK & s); }
inline bool b_check(data_vector s){ return (B_CHECK & s); }
inline bool w_checkmate(data_vector s){ return (W_CHECKMATE & s); }
inline bool b_checkmate(data_vector s){ return (B_CHECKMATE & s); }

inline bool w_en_passant(data_vector s){ return (W_EN_PASSANT & s); }
inline int  w_en_passant_x(data_vector s){ return (s>>9) & 7; }
inline bool b_en_passant(data_vector s){ return (B_EN_PASSANT & s); }
inline int  b_en_passant_x(data_vector s){ return (s>>13) & 7; }
inline bool draw(data_vector s){ return (DRAW & s); }

inline void set_w_can_rcastle(data_vector& s){ s |= W_CAN_RCASTLE; }
inline void set_w_can_lcastle(data_vector& s){ s |= W_CAN_LCASTLE; }
inline void set_b_can_rcastle(data_vector& s){ s |= B_CAN_RCASTLE; }
inline void set_b_can_lcastle(data_vector& s){ s |= B_CAN_LCASTLE; }
inline void set_w_check(data_vector& s){ s |= W_CHECK; }
inline void set_b_check(data_vector& s){ s |= B_CHECK; }
inline void set_w_checkmate(data_vector& s){ s |= W_CHECKMATE; }
inline void set_b_checkmate(data_vector& s){ s |= B_CHECKMATE; }

inline void set_w_en_passant_x(data_vector& s, int x){ s = (s & ~(7<<9 )) | (x<<9)  | W_EN_PASSANT; }
inline void set_b_en_passant_x(data_vector& s, int x){ s = (s & ~(7<<13)) | (x<<13) | B_EN_PASSANT; }

inline void set_draw(data_vector& s){ s |= DRAW; }

inline void clear_w_can_rcastle(data_vector& s){ s &= ~W_CAN_RCASTLE; }
inline void clear_w_can_lcastle(data_vector& s){ s &= ~W_CAN_LCASTLE; }
inline void clear_b_can_rcastle(data_vector& s){ s &= ~B_CAN_RCASTLE; }
inline void clear_b_can_lcastle(data_vector& s){ s &= ~B_CAN_LCASTLE; }
inline void clear_w_check(data_vector& s){ s &= ~W_CHECK; }
inline void clear_b_check(data_vector& s){ s &= ~B_CHECK; }
inline void clear_w_checkmate(data_vector& s){ s &= ~W_CHECKMATE; }
inline void clear_b_checkmate(data_vector& s){ s &= ~B_CHECKMATE; }
inline void clear_w_en_passant(data_vector& s){ s &= ~((7<<9) | W_EN_PASSANT); }
inline void clear_b_en_passant(data_vector& s){ s &= ~((7<<13) | B_EN_PASSANT); }
inline void clear_draw(data_vector& s){ s &= ~DRAW; }
inline void clear_final_status_bits(data_vector& s){ s &= ~(DRAW | W_CHECKMATE | B_CHECKMATE); }

typedef int position_vector;

inline int w_king_x(position_vector v){ return v & 7; }
inline int w_king_y(position_vector v){ return (v>>3) & 7; }
inline int b_king_x(position_vector v){ return (v>>6) & 7; }
inline int b_king_y(position_vector v){ return (v>>9) & 7; }

inline void set_w_king_pos(position_vector& v, int x, int y){ v = x | (y<<3) | (v & (~63)); }
inline void set_b_king_pos(position_vector& v, int x, int y){ v = (x<<6) | (y<<9) | (v & ~(63<<6)); }

struct GameState {
   
    // game state pieces:
    array<piece,64> board;
    data_vector state;
    position_vector king_pos;

    GameState();
    
    inline piece get_piece(int x, int y) const {
        return board[(y<<3) | x];
    }
    
    inline void set_piece(int x, int y, piece p){
        board[(y<<3) | x] = p;
    }
    
    friend ostream& operator<<(ostream& os, const GameState& s);
    friend bool operator==(const GameState& lhs, const GameState& rhs);
};

/*
struct GameStateHasher {
    size_t operator()(const GameState& gs) const {
        size_t h = gs.state;
        for (auto p : gs.board){
            h ^= std::hash<int>{}(p)  + 0x9e3779b9 + (h << 6) + (h >> 2); 
        }
        return h;
    }
};
*/

string to_statestring(data_vector s);


#endif // CHESS_GAME_STATE_H
