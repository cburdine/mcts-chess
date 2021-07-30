#include <sstream>
#include <cassert>
#include <array>

#include "game_logic.h"

using namespace std;

string pos_str(int x, int y){
    stringstream ss;
    ss << ((char) 'a' + x) << y;
    return ss.str();
}

string to_movestring(GameState& gs, move_vector m, bool shorthand){
    int x0, y0, x1, y1;
    x0 = src_x(m);
    y0 = src_y(m);
    x1 = dest_x(m);
    y1 = dest_y(m);
    
    // perform a move sanity check:
    piece src_p = gs.get_piece(x0,y0);
    piece dest_p = gs.get_piece(x1,y1);
    assert( src_p );
    assert( captured_piece(m) == src_p );

    // compute final state and check/mate status:
    GameState move_gs = gs;
    apply_move(move_gs, m);

    // parse check/cgeckmate from state:
    bool is_check, is_mate;
    if(is_black(src_p)){
        is_check = w_check(move_gs.state);
        is_mate = w_checkmate(move_gs.state);
    } else {
        is_check = b_check(move_gs.state);
        is_mate = b_checkmate(move_gs.state);
    }

    // castling notation:
    if(is_rcastle(m)){
        return "O-O";
    } else if(is_lcastle(m)){
        return "O-O-O";
    }

    // indicate check/checkmate:
    stringstream ss;
    ss << to_char(src_p,shorthand) 
        << pos_str(x0,y0)
        << (dest_p? "x" : "")
        << pos_str(x1,y1);
    if(is_mate){
        ss << "#";
    } else if(is_check){
        ss << "+";
    }

    return ss.str();
}

void apply_move(GameState& gs, move_vector m){
    int x0, y0, x1, y1;
    x0 = src_x(m);
    y0 = src_y(m);
    x1 = dest_x(m);
    y1 = dest_y(m);
    
    
    piece src_p = gs.get_piece(x0,y0);
    piece dest_p = gs.get_piece(x1,y1);
    piece cap_p  = captured_piece(m);
    color src_color = get_color(src_p);
    color oth_color = !src_color;
    
    // perform quick sanity check:
    assert( src_p );
    assert( dest_p == captured_piece(m) );

    if(cap_p){
        assert(get_color(cap_p) == oth_color && !is_king(cap_p));

        // TODO: handle pawn promotion logics (pawn captures self)
        
        if(!dest_p){
            // perform an en passant capture:
            assert(is_pawn(cap_p));
            assert(gs.get_piece(x0,y1) == cap_p);
            assert((src_color == WHITE)? b_enpassant(gs.state,x1) : w_enpassant(gs.state,x1));
            gs.set_piece(x0,x1,NONE);
        } else {
            // perform a simple capture:
            assert(dest_p == cap_p);
        }
        gs.set_piece(x0, y0, NONE);
        gs.set_piece(x1, y1, src_p);
    
    } else if(is_rcastle(m)){
        // perform a right castle:
        assert((src_color == BLACK)? b_can_rcastle(m) : w_can_rcastle(m));
        int csl_y = (src_color == WHITE)?  0 : 7;
        
        // validate castling positions:
        assert(x0 == 4 && y0 == csl_y && x1 == 7 && y1 == csl_y);
        assert(get_color(src_p) == get_color(dest_p));
        assert(is_king(src_p));
        assert(is_rook(dest_p));
        assert((!gs.get_piece(5,csl_y)) && (!gs.get_piece(6,csl_y)));
        
        // ensure castling will not check the king:
        assert(!is_checked(gs,4,csl_y,oth_color));
        assert(!is_checked(gs,5,csl_y,oth_color));
        assert(!is_checked(gs,6,csl_y,oth_color));

        // perform castle:
        gs.set_piece(4,csl_y,NONE);
        gs.set_piece(7,csl_y,NONE);
        gs.set_piece(5,csl_y,B_ROOK);
        gs.set_piece(6,csl_y,B_KING);
        if(src_color == WHITE){
            clear_w_can_lcastle(gs.state);
            clear_w_can_rcastle(gs.state);
        } else {
            clear_b_can_lcastle(gs.state);
            clear_b_can_rcastle(gs.state);
        }

    } else if(is_lcastle(m)){
        // perform a left castle:
        assert((src_color == BLACK)? b_can_lcastle(m) : w_can_lcastle(m));
        int csl_y = (src_color == WHITE)?  0 : 7;

        // validate castling positions:
        assert(x0 == 4 && y0 == csl_y && x1 == 0 && y1 == csl_y);
        assert(src_p == B_KING && dest_p == B_ROOK);
        assert((!gs.get_piece(1,7)) && (!gs.get_piece(2,7)) && (!gs.get_piece(3,7)));
        assert(get_color(src_p) == get_color(dest_p));
        assert(is_king(src_p));
        assert(is_rook(dest_p));
        assert((!gs.get_piece(1,csl_y)) && (!gs.get_piece(2,csl_y)) && (!gs.get_piece(3,csl_y)));
        
        // ensure castling will not check the king:
        assert(!is_checked(gs,4,csl_y,oth_color));
        assert(!is_checked(gs,5,csl_y,oth_color));
        assert(!is_checked(gs,6,csl_y,oth_color));

        // perform castle:
        gs.set_piece(4,csl_y,NONE);
        gs.set_piece(0,csl_y,NONE);
        gs.set_piece(3,csl_y,B_ROOK);
        gs.set_piece(2,csl_y,B_KING);

        if(src_color == WHITE){
            clear_w_can_lcastle(gs.state);
            clear_w_can_rcastle(gs.state);
        } else {
            clear_b_can_lcastle(gs.state);
            clear_b_can_rcastle(gs.state);
        }
    } else {
        // perform a simple move:
        gs.set_piece(x0, y0, NONE);
        gs.set_piece(x1, y1, src_p);
    }

    // clear enpassant bits and update king check status:
    int kx, ky;
    if(src_color == WHITE){

        clear_w_enpassant(gs.state);

        // handle setting of enpassant:
        if((src_p == W_PAWN) && (y0 == 1) && (y1 == 3)){
            set_w_enpassant(gs.state, x0);
        }

        // get/update king position:
        kx = w_king_x(gs.king_pos);
        ky = w_king_y(gs.king_pos);
        assert(gs.get_piece(kx,ky) == W_KING);
        if(src_p == W_KING){
            kx = x1;
            ky = y1;
            set_w_king_pos(gs.king_pos,kx,ky);
        }

        // ensure king is not in check:
        assert(!is_checked(gs, kx, ky, oth_color));
        clear_b_check(gs.state);

    } else {

        clear_b_enpassant(gs.state);
        
        // handle setting of enpassant:
        if((src_p == B_PAWN) && (y0 == 6) && (y1 == 4)){
            set_b_enpassant(gs.state, x0);
        }

        // get/update king position:
        kx = b_king_x(gs.king_pos);
        ky = b_king_y(gs.king_pos);
        if(src_p == B_KING){
            kx = x1;
            ky = y1;
            set_b_king_pos(gs.king_pos,kx,ky);
        }

        // ensure king is not in check:
        assert(!is_checked(gs, kx, ky, oth_color));
        clear_b_check(gs.state);
    }
}

bool is_checked(GameState& gs, int x, int y, color attacker){
    piece p;
    int x1, y1;
    
    // check horizontal/vertical tiles:
    for(x1 = (x+1); x1 < 8; ++x1){
        p = gs.get_piece(x1,y);
        if(get_color(p) != attacker){ break; }
        else if(is_rook(p) || is_queen(p)){ return true; }
        else if(((x1-x) == 1) && is_king(p)){ return true; }
        else if(get_color(p) == attacker){ break; }
    } for(x1 = (x-1); x1 >= 0; --x1){
        p = gs.get_piece(x1,y);
        if(get_color(p) != attacker){ break; }
        else if(is_rook(p) || is_queen(p)){ return true; }
        else if(((x-x1) == 1) && is_king(p)){ return true; }
        else if(get_color(p) == attacker){ break; }
    } for(y1 = (y+1); y1 < 8; ++y1){
        p = gs.get_piece(x,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_rook(p) || is_queen(p)){ return true; }
        else if(((y1-y) == 1) && is_king(p)){ return true; }
        else if(get_color(p) == attacker){ break; }
    } for(y1 = (y-1); y1 >= 0; --y1){
        p = gs.get_piece(x,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_rook(p) || is_queen(p)){ return true; }
        else if(((y-y1) == 1) && is_king(p)){ return true; }
        else if(get_color(p) == attacker){ break; }
    }

    // check diagonal tiles:
    x1 = x+1; y1 = y+1; // NE
    while(x1 < 8 && y1 < 8){
        p = gs.get_piece(x1,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_bishop(p) || is_queen(p)){ return true; }
        else if(((x1-x) == 1) && (is_king(p) || p == B_PAWN)){ return true; }
        else if(get_color(p) == attacker){ break; }
        ++x1; ++y1;
    }
    x1 = x+1; y1 = y-1; // SE
    while(x1 < 8 && y >= 0){
        p = gs.get_piece(x1,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_bishop(p) || is_queen(p)){ return true; }
        else if(((x1-x) == 1) && (is_king(p) || p == W_PAWN)){ return true; }
        else if(get_color(p) == attacker){ break; }
        ++x1; --y1;
    }
    x1 = x-1; y1 = y+1; // NW
    while(x1 >= 0 && y1 < 8){
        p = gs.get_piece(x1,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_bishop(p) || is_queen(p)){ return true; }
        else if(((x-x1) == 1) && (is_king(p) || p == B_PAWN)){ return true; }
        else if(get_color(p) == attacker){ break; }
        --x1; ++y1;
    }
    x1 = x-1; y1 = y-1; // SW
    while(x1 >= 0 && y1 >= 0){
        p = gs.get_piece(x1,y1);
        if(get_color(p) != attacker){ break; }
        else if(is_bishop(p) || is_queen(p)){ return true; }
        else if(((x-x1) == 1) && (is_king(p) || p == W_PAWN)){ return true; }
        else if(get_color(p) == attacker){ break; }
        --x1; --y1;
    }

    // check knights:
    const int KNIGHT_X[] = { 2, 1, -1, -2, -2, -1,  1,  2 };
    const int KNIGHT_Y[] = { 1, 2,  2,  1, -1, -2, -2, -1 };
    for(int i = 0; i < 8; ++i){
        x1 = x+KNIGHT_X[i];
        y1 = y+KNIGHT_Y[i];
        if( 0 <= x1 && x1 < 8 && 0 <= y1 && y1 < 8){
            p = gs.get_piece(x1,y1);
            if(is_knight(p) && (get_color(p) == attacker)){ 
                return true;
            }
        }
    }

    return false;
}