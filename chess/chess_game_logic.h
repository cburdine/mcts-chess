#ifndef CHESS_GAME_LOGIC_H
#define CHESS_GAME_LOGIC_H

#include <vector>
#include <sstream>
#include <cassert>

#include "chess_game_state.h"

using namespace std;

typedef int move_vector;

// bit masks:
const int RCASTLE = (1<<16);
const int LCASTLE = (1<<17);
const int EN_PASSANT = (1<<18);
const int PREV_EN_PASSANT = (1<<23);
const int PREV_RCASTLE = (1<<27);
const int PREV_LCASTLE = (1<<28);
const int PREV_OTH_RCASTLE = (1<<29);
const int PREV_OTH_LCASTLE = (1<<30);
const int PREV_CHECK = (1<<31);

//TODO: implement a prev_oth_check bit for faster state undos.

inline int src_x(move_vector m){ return m & 7; }
inline int src_y(move_vector m){ return (m>>3) & 7; }
inline int dest_x(move_vector m){ return (m>>6) & 7; }
inline int dest_y(move_vector m){ return (m>>9) & 7; }
inline piece captured_piece(move_vector m){ return static_cast<piece>((m>>12) & 15); }
inline bool is_rcastle(move_vector m){ return m & RCASTLE; }
inline bool is_lcastle(move_vector m){ return m & LCASTLE; }
inline bool is_en_passant(move_vector m){ return m & EN_PASSANT; }
inline piece promoted_piece(move_vector m){ return static_cast<piece>((m>>19) & 15); }
inline bool prev_en_passant(move_vector m){ return m & PREV_EN_PASSANT; }
inline int prev_en_passant_x(move_vector m){ return (m>>24) & 7; }
inline bool prev_rcastle(move_vector m){ return m & PREV_RCASTLE; }
inline bool prev_lcastle(move_vector m){ return m & PREV_LCASTLE; }
inline bool prev_oth_rcastle(move_vector m){ return m & PREV_OTH_RCASTLE; }
inline bool prev_oth_lcastle(move_vector m){ return m & PREV_OTH_LCASTLE; }
inline bool prev_check(move_vector m){ return m & PREV_CHECK; }

inline void set_src_pos(move_vector& m, int x, int y){ m = (m & ~(63)) | x | (y<<3); }
inline void set_dest_pos(move_vector& m, int x, int y){ m = (m & ~(63<<6)) | (x<<6) | (y<<9); }
inline void set_captured_piece(move_vector& m, piece cap_p){ m = (m & ~(15<<12)) | (cap_p<<12); }
inline void set_rcastle(move_vector& m){ m |= RCASTLE; }
inline void set_lcastle(move_vector& m){ m |= LCASTLE; }
inline void set_en_passant(move_vector& m){ m |= EN_PASSANT; }
inline void set_promoted_piece(move_vector& m, piece prom_p){ m = (m & ~(15<<19)) | (prom_p << 19); }
inline void set_prev_en_passant(move_vector& m){ m |= PREV_EN_PASSANT; }
inline void set_prev_en_passant_x(move_vector& m, int x){ m = (m & ~(7<<24)) | (x<<24) | PREV_EN_PASSANT; }
inline void set_prev_rcastle(move_vector& m){ m |= PREV_RCASTLE; }
inline void set_prev_lcastle(move_vector& m){ m |= PREV_LCASTLE; }
inline void set_prev_oth_rcastle(move_vector& m){ m |= PREV_OTH_RCASTLE; }
inline void set_prev_oth_lcastle(move_vector& m){ m |= PREV_OTH_LCASTLE; }
inline void set_prev_check(move_vector& m){ m |= PREV_CHECK; }

inline void clear_rcastle(move_vector& m){ m &= ~(RCASTLE); }
inline void clear_lcastle(move_vector& m){ m &= ~(LCASTLE); }
inline void clear_en_passant(move_vector& m){ m &= ~(EN_PASSANT); }
inline void clear_prev_rcastle(move_vector& m){ m &= ~(PREV_RCASTLE); }
inline void clear_prev_lcastle(move_vector& m){ m &= ~(PREV_LCASTLE); }
inline void clear_prev_oth_rcastle(move_vector& m){ m &= ~(PREV_OTH_RCASTLE); }
inline void clear_prev_oth_lcastle(move_vector& m){ m &= ~(PREV_OTH_LCASTLE); }

string pos_str(int x, int y);
string to_movestring(GameState gs, move_vector m, bool shorthand=false);
string to_move_vector_string(move_vector& m);
bool parse_text_move(move_vector& m, GameState& gs, color player_to_move, string str);

void apply_move(GameState& gs, move_vector m);
void undo_move(GameState& gs, move_vector m);

bool is_checked(GameState& gs, int x, int y, color attacker);

vector<move_vector> get_valid_moves(GameState& gs, color player);

inline void add_valid_pawn_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves);
inline void add_valid_rectilinear_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves);
inline void add_valid_knight_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves);
inline void add_valid_diagonal_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves);
inline void add_valid_king_moves(GameState& gs, color player, move_vector base_m, int x, int y, vector<move_vector>& moves);

bool move_will_check_king(GameState& gs, move_vector m, color king_color);

# endif // CHESS_GAME_LOGIC_H
