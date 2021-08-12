#include <sstream>
#include <cassert>
#include <array>

#include "game_logic.h"

using namespace std;

string pos_str(int x, int y){
    stringstream ss;
    ss << static_cast<char>('a' + x) << (y+1);
    return ss.str();
}

string to_movestring(GameState& gs, move_vector m, bool shorthand){
    int x0, y0, x1, y1;
    piece cap_p;

    x0 = src_x(m);
    y0 = src_y(m);
    x1 = dest_x(m);
    y1 = dest_y(m);
    cap_p = captured_piece(m);
    
    // perform a move sanity check:
    piece src_p = gs.get_piece(x0,y0);
    piece dest_p = gs.get_piece(x1,y1);
    assert( src_p );
    assert( !cap_p || is_en_passant(m) || cap_p == dest_p );

    // compute final state and check/mate status:
    GameState move_gs = gs;
    apply_move(move_gs, m);

    // parse check/checkmate from state:
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
        << (cap_p? "x" : "")
        << pos_str(x1,y1)
        << "  [" << x0 << "," << y0 << "] --> [" << x1 << "," << y1 << "]";
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
    piece prom_p = promoted_piece(m);
    color src_color = get_color(src_p);
    color oth_color = !src_color;
    assert( src_p );

    if(prom_p){
            // perform pawn promotion:
            assert(get_color(prom_p) == src_color);
            assert(!is_king(prom_p));
            assert(!is_pawn(prom_p));
            assert((src_color == WHITE && y1 == 7) || (src_color == BLACK && y1 == 0));
            gs.set_piece(x0, y0, NONE);
            gs.set_piece(x1, y1, prom_p);

    } else if(cap_p){
        assert(get_color(cap_p) == oth_color);
        assert(!is_king(cap_p));

        if(is_en_passant(m)){
            // perform an en passant capture:
            assert(!dest_p);
            assert(is_pawn(src_p));
            assert(is_pawn(cap_p));
            if(oth_color == WHITE){
                assert(w_en_passant(gs.state,x1));
                assert(gs.get_piece(x1,y1+1) == cap_p);
                gs.set_piece(x1,y1+1,NONE);
            } else {
                assert(gs.get_piece(x1,y1-1) == cap_p);
                assert(b_en_passant(gs.state,x1));
                gs.set_piece(x1, y1-1, NONE);
            }

        } else {
            // perform a simple capture:
            assert(dest_p == cap_p);
        }
        gs.set_piece(x0, y0, NONE);
        gs.set_piece(x1, y1, src_p);
    
    } else if(is_rcastle(m)){

        // perform a right castle:
        assert((src_color == BLACK)? b_can_rcastle(gs.state) : w_can_rcastle(gs.state));
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
        x1 = 6; // <-- set x2 to account for king movement

        if(src_color == WHITE){
            gs.set_piece(5,csl_y,W_ROOK);
            gs.set_piece(6,csl_y,W_KING);
        } else {
            gs.set_piece(5,csl_y,B_ROOK);
            gs.set_piece(6,csl_y,B_KING);
        }

    } else if(is_lcastle(m)){
        // perform a left castle:
        assert((src_color == BLACK)? b_can_lcastle(gs.state) : w_can_lcastle(gs.state));
        int csl_y = (src_color == WHITE)?  0 : 7;

        // validate castling positions:
        assert(x0 == 4 && y0 == csl_y && x1 == 0 && y1 == csl_y);
        assert(src_p ==  ((src_color == WHITE)? W_KING : B_KING));
        assert(dest_p == ((src_color == WHITE)? W_ROOK : B_ROOK));
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
        x1 = 2; // <-- set x2 to account for king movement

        if(src_color == WHITE){
            gs.set_piece(3,csl_y,W_ROOK);
            gs.set_piece(2,csl_y,W_KING);
        } else {
            gs.set_piece(3,csl_y,B_ROOK);
            gs.set_piece(2,csl_y,B_KING);
        }
    } else {
        // perform a simple move:
        gs.set_piece(x0, y0, NONE);
        gs.set_piece(x1, y1, src_p);
    }

    // clear enpassant bits and update king check status:
    if(src_color == WHITE){

        clear_w_en_passant(gs.state);

        // handle setting of enpassant:
        if((src_p == W_PAWN) && (y0 == 1) && (y1 == 3)){
            set_w_en_passant(gs.state, x0);

        // get/update king position and castling bits:
        } else if(src_p == W_KING){
            set_w_king_pos(gs.king_pos,x1,y1);
            clear_w_can_lcastle(gs.state);
            clear_w_can_rcastle(gs.state);
        
        // update castling bits for movement:
        } else if(src_p == W_ROOK && y0 == 0){
            if(x0 == 0){
                clear_w_can_lcastle(gs.state);
            } else if(x0 == 7){
                clear_w_can_rcastle(gs.state);
            }

        // update opponent's castling bits for a capture:
        } else if(cap_p == B_ROOK && y1 == 7){
            if(x1 == 0){
                clear_b_can_lcastle(gs.state);
            } else if(x1 == 7){
                clear_b_can_rcastle(gs.state);
            }
        }

        // ensure king is not in check:
        assert(!is_checked(gs, w_king_x(gs.king_pos), w_king_y(gs.king_pos), oth_color));
        clear_w_check(gs.state);

    } else {

        clear_b_en_passant(gs.state);
        
        // handle setting of en passant bits:
        if((src_p == B_PAWN) && (y0 == 6) && (y1 == 4)){
            set_b_en_passant(gs.state, x0);
        
        // get/update king position:
        } else if(src_p == B_KING){
            set_b_king_pos(gs.king_pos,x1,y1);
            clear_b_can_lcastle(gs.state);
            clear_b_can_rcastle(gs.state);

        // update castling bits:
        } else if(src_p == B_ROOK && y0 == 7){
            if(x0 == 0){
                clear_b_can_lcastle(gs.state);
            } else if(x0 == 7){
                clear_b_can_rcastle(gs.state);
            }
        
        // update opponent's castling bits for a capture:
        } else if(cap_p == W_ROOK && y1 == 0){
            if(x1 == 0){
                clear_w_can_lcastle(gs.state);
            } else if(x1 == 7){
                clear_w_can_rcastle(gs.state);
            }
        }

        // ensure king is not in check:
        assert(!is_checked(gs, b_king_x(gs.king_pos), b_king_y(gs.king_pos), oth_color));
        clear_b_check(gs.state);
    }
}

void undo_move(GameState& gs, move_vector m){

    int x0, y0, x1, y1;
    x0 = src_x(m);
    y0 = src_y(m);
    x1 = dest_x(m);
    y1 = dest_y(m);

    piece src_p = gs.get_piece(x0,y0);
    piece dest_p = gs.get_piece(x1,y1);
    piece cap_p  = captured_piece(m);
    piece prom_p = promoted_piece(m);
    color dest_color = get_color(dest_p);
    color oth_color = !dest_color;
    assert(!src_p);

    if(prom_p){
            // undo pawn promotion:
            assert(prom_p == dest_p);
            assert(!is_king(prom_p));
            assert(!is_pawn(prom_p));
            if(dest_color == WHITE){
                assert(y1 == 7);
                assert(y0 == 6);
                gs.set_piece(x0, y0, W_PAWN);
            } else {
                assert(y1 == 0);
                assert(y0 == 1);
                gs.set_piece(x0, y0, B_PAWN);
            }

            // return any pawn-captured piece:
            gs.set_piece(x1, y1, cap_p);

    } else if(cap_p){

        assert(get_color(cap_p) == oth_color);
        assert(!is_king(cap_p));

        if(is_en_passant(m)){

            // undo an en passant capture:
            assert(is_pawn(cap_p));
            assert(prev_en_passant(m));
            assert(prev_en_passant_x(m) == x1);
            if(oth_color == WHITE){
                assert(gs.get_piece(x1,y1+1) == NONE);
                assert(y1 == 2);
                gs.set_piece(x1,y1+1,W_PAWN);
            } else {
                assert(gs.get_piece(x1,y1-1) == cap_p);
                assert(y1 == 5);
                gs.set_piece(x1, y1-1, NONE);
            }

        }

        // undo a simple capture:
        gs.set_piece(x0, y0, dest_p);
        gs.set_piece(x1, y1, cap_p);
    
    } else if(is_rcastle(m)){
        
        // validate positions (and color) after castling:
        assert(x0 == 4 && x1 == 7);
        assert(y0 == y1);
        assert(get_color(gs.get_piece(5,y0)) == get_color(gs.get_piece(6,y0)));
        assert(is_king(gs.get_piece(6,y0)));
        assert(is_rook(gs.get_piece(5,y0)));
        assert(!src_p);
        assert(!dest_p);
        dest_p = gs.get_piece(6,y0);
        dest_color = get_color(dest_p);
        oth_color = !dest_color;

        // undo a right castle:
        gs.set_piece(5,y0,NONE);
        gs.set_piece(6,y0,NONE);
        if(dest_color == WHITE){
            gs.set_piece(4,y0,W_KING);
            gs.set_piece(7,y0,W_ROOK);
        } else {
            gs.set_piece(4,y0,B_KING);
            gs.set_piece(7,y0,B_ROOK);
        }

    } else if(is_lcastle(m)){
        
        // validate castling positions (and color) after castling:
        assert(x0 == 4 && x1 == 0);
        assert(y0 == y1);
        assert(get_color(gs.get_piece(2,y0)) == get_color(gs.get_piece(3,y0)));
        assert(is_king(gs.get_piece(2,y0)));
        assert(is_rook(gs.get_piece(3,y0)));
        assert(!src_p);
        assert(!dest_p);
        dest_p = gs.get_piece(2,y0);
        dest_color = get_color(dest_p);
        oth_color = !dest_color;
        
        // undo a left castle:
        gs.set_piece(2,y0, NONE);
        gs.set_piece(3,y0,NONE);
        if(dest_color == WHITE){
            gs.set_piece(0,y0,W_ROOK);
            gs.set_piece(4,y0,W_KING);
        } else {
            gs.set_piece(0,y0,B_ROOK);
            gs.set_piece(4,y0,B_KING);
        }

    } else {
        // undo a simple move:
        assert(dest_p);
        gs.set_piece(x0, y0, dest_p);
        gs.set_piece(x1, y1, NONE);
    }


    if(dest_color == WHITE){

        // restore white en passant bits:
        clear_w_en_passant(gs.state);
        if(prev_en_passant(m)){
            set_w_en_passant(gs.state, prev_en_passant_x(m));
        }

        // restore white castle bits:
        if(prev_lcastle(m)){ set_w_can_lcastle(gs.state); }
        if(prev_rcastle(m)){ set_w_can_rcastle(gs.state); }

        // restore white king position:
        if(dest_p == W_KING){
            set_w_king_pos(gs.king_pos, x0, y0);
        }

        // restore white check status:
        if(is_checked(gs, x0, y0, oth_color)){
            set_w_check(gs.state);
        } else {
            clear_w_check(gs.state);
        }

    } else {
        
        // restore black en passant bits:
        clear_b_en_passant(gs.state);
        if(prev_en_passant(m)){
            set_b_en_passant(gs.state, prev_en_passant_x(m));
        }

        // restore black castle bits:
        if(prev_lcastle(m)){ set_b_can_lcastle(gs.state); }
        if(prev_rcastle(m)){ set_b_can_rcastle(gs.state); }

        // restore black king position:
        if(dest_p == W_KING){
            set_b_king_pos(gs.king_pos, x0, y0);
        }

        // restore black check status:
        if(is_checked(gs, x0, y0, oth_color)){
            set_b_check(gs.state);
        } else {
            clear_b_check(gs.state);
        }
    }
}

bool is_checked(GameState& gs, int x, int y, color attacker){
    int xt, yt;
    piece p;

    // check right direction:
    xt = x+1; yt = y;
    while(xt < 8){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_rook(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        ++xt;
    }

    // check up direction:
    xt = x; yt = y+1;
    while(yt < 8){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_rook(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        ++yt;
    }

    // check left direction:
    xt = x-1; yt = y;
    while(xt >= 0){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_rook(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        --xt;
    }

    // check down direction:
    xt = x; yt = y-1;
    while(yt >= 0){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_rook(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        --yt;
    }

    // check up+right direction:
    xt = x+1; yt = y+1;
    while(xt < 8 && yt < 8){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_bishop(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        ++xt;
        ++yt;
    }

    // check up+left direction:
    xt = x-1; yt = y+1;
    while(xt >= 0 && yt < 8){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_bishop(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        --xt;
        ++yt;
    }

    // check down+left direction:
    xt = x-1; yt = y-1;
    while(xt >= 0 && yt >= 0){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_bishop(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        --xt;
        --yt;
    }

    // check down+right direction:
    xt = x+1; yt = y-1;
    while(xt < 8 && yt >= 0){
        p = gs.get_piece(xt,yt);
        if(p){
            if((is_bishop(p) || is_queen(p)) && get_color(p) == attacker){ 
                return true;
            } break;
        }
        ++xt;
        --yt;
    }

    // check for knight attacks:
    const int KNIGHT_DX[8] = { 2, 1, -1, -2, -2, -1,  1, 2 };
    const int KNIGHT_DY[8] = { 1, 2,  2,  1, -1, -2, -2, 1 };
    for(int i = 0; i < 8; ++i){
        xt = x+KNIGHT_DX[i];
        yt = y+KNIGHT_DY[i];
        if(0 <= xt && xt < 8 && 0 <= yt && yt < 8){
            p = gs.get_piece(xt,yt);
            if(is_knight(p) && get_color(p) == attacker){
                return true;
            }
        }
    }

    // check for pawn and king attacks:
    if(attacker == WHITE){
        yt = y-1;
        if(yt > 1 && ( (x < 7 && gs.get_piece(x+1,yt) == W_PAWN) 
                    || (x > 0 && gs.get_piece(x-1,yt) == W_PAWN))){
            return true;
        } else if (abs(w_king_x(gs.king_pos) - x) <= 1 
                && abs(w_king_y(gs.king_pos)-y) <= 1){
            assert(gs.get_piece(w_king_x(gs.king_pos),w_king_y(gs.king_pos)) == W_KING);
            return true;
        }

    } else {
        yt = y+1;
        if (yt < 6 && (  (x < 7 && gs.get_piece(x+1,yt) == B_PAWN)
                     ||  (x > 0 && gs.get_piece(x-1,yt) == B_PAWN))){
            return true;
        } else if( abs(b_king_x(gs.king_pos)-x) <= 1 
                && abs(b_king_y(gs.king_pos)-y) <= 1){
            assert(gs.get_piece(b_king_x(gs.king_pos),b_king_y(gs.king_pos)) == B_KING);
            return true;
        }
    }

    return false;
}

vector<move_vector> get_valid_moves(GameState& gs, color player){
    move_vector m = 0;

    vector<move_vector> valid_moves = vector<move_vector>();

    // initialize previous data in m:
    if(player == WHITE){
        if(w_check(gs.state)){ set_prev_check(m); }
        if(w_can_rcastle(gs.state)){ set_prev_rcastle(m); }
        if(w_can_lcastle(gs.state)){ set_prev_lcastle(m); }
    } else {
        if(b_check(gs.state)){ set_prev_check(m); }
        if(b_can_rcastle(gs.state)){ set_prev_rcastle(m); }
        if(b_can_lcastle(gs.state)){ set_prev_lcastle(m); }
    }

    // iterate over board:
    int i, x, y;
    piece p;
    bool only_kings_left = true;
    for(i = 0; i < 64; ++i){
        p = gs.board[i];
        if(p && get_color(p) == player){
            x = i&7; y = i>>3;
            if(is_pawn(p)){
                add_valid_pawn_moves(gs, player, m, x, y, valid_moves);
            } else if(is_rook(p)){
                add_valid_rectilinear_moves(gs, player, m, x, y, valid_moves);
            } else if(is_knight(p)){
                add_valid_knight_moves(gs, player, m, x, y, valid_moves);
            } else if(is_bishop(p)){
                add_valid_diagonal_moves(gs, player, m, x, y, valid_moves);
            } else if(is_queen(p)){
                add_valid_rectilinear_moves(gs, player, m, x, y, valid_moves);
                add_valid_diagonal_moves(gs, player, m, x, y, valid_moves);
            } else {
                assert(is_king(p));
                add_valid_king_moves(gs, player, m, x, y, valid_moves);
            }
        }
        if(only_kings_left && p && !is_king(p)){ only_kings_left = false; }
    }

    // if only kings are left, return a draw state:
    if(only_kings_left){
        set_draw(gs.state);
        return vector<move_vector>();

    } else if(valid_moves.empty()){

        // if no moves are available, set draw or checkmate status:
        if(player == WHITE && w_check(gs.state)){
            set_w_checkmate(gs.state);
        } else if(player == BLACK && b_check(gs.state)) {
            set_b_checkmate(gs.state);
        } else {
            set_draw(gs.state);
        }
    }

    return valid_moves;
}


inline void add_valid_pawn_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves){
    
    assert(is_pawn(gs.get_piece(x,y)));
    assert(get_color(gs.get_piece(x,y)) == player);
    assert(y > 0);
    assert(y < 7);

    // TODO: handle pawn "underpromotion"

    piece cap_p;
    move_vector m2;
    set_src_pos(base_m, x, y);

    int dy = (player == WHITE)? 1 : -1;
    int yt = y+dy;
    int xt;

    for(int dx = -1; dx <= 1; dx += 2){
        xt = x+dx;
        // check capture in dx direction:
        if(0 <= xt && xt < 8 && (cap_p = gs.get_piece(xt,yt)) && get_color(cap_p) != player && !is_king(cap_p)){
            m2 = base_m;
            set_dest_pos(m2,xt,yt);
            set_captured_piece(m2, cap_p);
            if(player == WHITE && yt == 7){
                set_promoted_piece(m2, W_QUEEN);
            } else if(player == BLACK && yt == 0){
                set_promoted_piece(m2, B_QUEEN);
            }
            if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
        }

        // check en passant in dx direction:
        if(0 <= xt && xt < 8 && !cap_p){
            if(player == WHITE && yt == 5 && gs.get_piece(xt,y) == B_PAWN && b_en_passant(gs.state, xt)){
                m2 = base_m;
                set_dest_pos(m2, xt,yt);
                set_captured_piece(m2, B_PAWN);
                set_en_passant(m2);
                if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
            } else if(player == BLACK && yt == 2 && gs.get_piece(xt,y) == W_PAWN && w_en_passant(gs.state, xt)){
                m2 = base_m;
                set_dest_pos(m2, xt,yt);
                set_captured_piece(m2, W_PAWN);
                set_en_passant(m2);
                if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
            }
        }
    }

    // check for forward move:
    if(!gs.get_piece(x,yt)){
        m2 = base_m;
        set_dest_pos(m2,x,yt);
        if(player == WHITE && yt == 7){
            set_promoted_piece(m2, W_QUEEN);
        } else if(player == BLACK && yt == 0){
            set_promoted_piece(m2, B_QUEEN);
        }
        if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }

        // check for double move forward:
        if(player == WHITE && y == 1 && !gs.get_piece(x,3)){
            set_dest_pos(m2, x, 3);
            if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
        } else if(player == BLACK && y == 6 && !gs.get_piece(x,4)){
            set_dest_pos(m2, x, 4);
            if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
        }
    }
}

inline void add_valid_rectilinear_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves){
    
    const int RECT_DX[4] = { 1,  0, -1,  0 };
    const int RECT_DY[4] = { 0,  1,  0, -1 };

    assert(is_rook(gs.get_piece(x,y)) || is_queen(gs.get_piece(x,y)));
    assert(get_color(gs.get_piece(x,y)) == player);

    move_vector m2;
    int dx, dy, xt, yt;
    piece cap_p;
    set_src_pos(base_m, x, y);

    // check possible moves in all directions:
    for(int i = 0; i < 4; ++i){
        dx = RECT_DX[i]; dy = RECT_DY[i];
        xt = x+dx; yt = y+dy;
        while(0 <= xt && xt < 8 && 0 <= yt && yt < 8){
            m2 = base_m;
            set_dest_pos(m2, xt, yt);
            cap_p = gs.get_piece(xt, yt);
            if(cap_p){
                set_captured_piece(m2, cap_p);
                if(get_color(cap_p) != player && !is_king(cap_p) && !move_will_check_king(gs, m2, player)){ 
                    moves.push_back(m2);
                }
                break;
            }
            if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
            xt += dx;
            yt += dy;
        }
    }
}

inline void add_valid_knight_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves){
    assert(is_knight(gs.get_piece(x,y)));
    assert(get_color(gs.get_piece(x,y)) == player);

    const int KNIGHT_DX[8] = { 2, 1, -1, -2, -2, -1,  1,  2 };
    const int KNIGHT_DY[8] = { 1, 2,  2,  1, -1, -2, -2, -1 };

    move_vector m2;
    piece cap_p;
    int xt, yt;
    set_src_pos(base_m, x, y);

    // check for valid knight moves:
    for(int i = 0; i < 8; ++i){
        xt = x + KNIGHT_DX[i];
        yt = y + KNIGHT_DY[i];
        if(0 <= xt && xt < 8 && 0 <= yt && yt < 8){
            m2 = base_m;
            cap_p = gs.get_piece(xt, yt);
            set_dest_pos(m2, xt, yt);
            if(cap_p){
                set_captured_piece(m2, cap_p);
                if(get_color(cap_p) != player && !is_king(cap_p) && !move_will_check_king(gs, m2, player)){
                    moves.push_back(m2);
                }
            } else if(!move_will_check_king(gs, m2, player)){
                moves.push_back(m2);
            }
        }
    }
}

inline void add_valid_diagonal_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves){
    
    const int DIAG_DX[4] = { 1, -1, -1,  1 };
    const int DIAG_DY[4] = { 1,  1, -1, -1 };
    
    assert(is_bishop(gs.get_piece(x,y)) || is_queen(gs.get_piece(x,y)));
    assert(get_color(gs.get_piece(x,y)) == player);

    move_vector m2;
    int dx, dy, xt, yt;
    piece cap_p;
    set_src_pos(base_m, x, y);

    // check possible moves in all directions:
    for(int i = 0; i < 4; ++i){
        dx = DIAG_DX[i]; dy = DIAG_DY[i];
        xt = x+dx; yt = y+dy;
        while(0 <= xt && xt < 8 && 0 <= yt && yt < 8){
            m2 = base_m;
            set_dest_pos(m2, xt, yt);
            cap_p = gs.get_piece(xt, yt);
            if(cap_p){
                set_captured_piece(m2, cap_p);
                if(get_color(cap_p) != player && !is_king(cap_p) && !move_will_check_king(gs, m2, player)){ 
                    moves.push_back(m2);
                }
                break;
            }
            if(!move_will_check_king(gs, m2, player)){ moves.push_back(m2); }
            xt += dx;
            yt += dy;
        }
    }
}

inline void add_valid_king_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves){

    const int KING_DX[8] = { 1,  1,  0, -1, -1, -1,  0,  1 };
    const int KING_DY[8] = { 0,  1,  1,  1,  0, -1, -1, -1 };

    assert(is_king(gs.get_piece(x,y)));
    assert(get_color(gs.get_piece(x,y)) == player);


    // check for standard moves:
    set_src_pos(base_m, x, y);
    int xt, yt;
    move_vector m2;
    piece cap_p;

    for(int i = 0; i < 8; ++i){
        xt = x + KING_DX[i];
        yt = y + KING_DY[i];
        if(0 <= xt && xt < 8 && 0 <= yt && yt < 8){
            m2 = base_m;
            set_dest_pos(m2, xt, yt);
            cap_p = gs.get_piece(xt, yt);
            if(cap_p){ 
                set_captured_piece(m2, cap_p);
                if(get_color(cap_p) != player && !is_king(cap_p) && !move_will_check_king(gs, m2, player)){ 
                    moves.push_back(m2);
                }
            } else if(!move_will_check_king(gs, m2, player)) {
                moves.push_back(m2);
            }
        }
    }

    // check for valid left castling moves:
    if((player == WHITE && w_can_lcastle(gs.state)) || (player == BLACK && b_can_lcastle(gs.state)) ){
        assert(y == 0 || y == 7);
        assert(is_rook(gs.get_piece(0,y)));
        if(  !gs.get_piece(1,y) && !gs.get_piece(2,y) && !gs.get_piece(3,y)
          && !is_checked(gs,2,y,!player) && !is_checked(gs,3,y,!player) && !is_checked(gs,4,y,!player) ){
            
            m2 = base_m;
            assert(is_rook(gs.get_piece(0,y)));
            set_dest_pos(m2,0,y);
            set_lcastle(m2);
            moves.push_back(m2);
        }
    }
    // check for valid right castling moves:
    if((player == WHITE && w_can_rcastle(gs.state)) || (player == BLACK && b_can_rcastle(gs.state)) ){
        assert(y == 0 || y == 7);
        assert(is_rook(gs.get_piece(7,y)));
        if(  !gs.get_piece(5,y) && !gs.get_piece(6,y)
          && !is_checked(gs,4,y,!player) && !is_checked(gs,5,y,!player) && !is_checked(gs,6,y,!player) ){
            
            m2 = base_m;
            assert(is_rook(gs.get_piece(7,y)));
            set_dest_pos(m2,7,y);
            set_rcastle(m2);
            moves.push_back(m2);
        }
    }
}

bool move_will_check_king(GameState& gs, move_vector m, color king_color){

    assert(!is_lcastle(m));
    assert(!is_rcastle(m));

    int x0 = src_x(m), y0 = src_y(m), x1 = dest_x(m), y1 = dest_y(m);
    int kx, ky;

    piece src_p = gs.get_piece(x0, y0);
    piece dest_p = gs.get_piece(x1, y1);
    piece cap_p;
    gs.set_piece(x0,y0, NONE);
    gs.set_piece(x1,y1, src_p);

    if(is_king(src_p)){
        kx = x1;
        ky = y1;
    } else if(king_color == WHITE){
        kx = w_king_x(gs.king_pos);
        ky = w_king_y(gs.king_pos);
    } else {
        kx = b_king_x(gs.king_pos);
        ky = b_king_y(gs.king_pos);
    }

    bool result;
    if(is_en_passant(m)) {
        cap_p = gs.get_piece(x1, y0);
        assert(is_pawn(cap_p));
        gs.set_piece(x1, y0, NONE);
    }

    result = is_checked(gs, kx, ky, !king_color);

    if(is_en_passant(m)){
        gs.set_piece(x1, y0, cap_p);
    }
    gs.set_piece(x0, y0, src_p);
    gs.set_piece(x1, y1, dest_p);

    return result;
}


