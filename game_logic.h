#ifndef GAME_LOGIC_H
#define GAME_LOGIC_H

#include <vector>
#include <array>
#include <sstream>
#include <cassert>

#include "game_state.h"

using namespace std;

// reperesentation of a move vector:
// [ castle (2) ] [ capture_piece (4) ] [ dest_position (6) ] [ src_position (6) ]
//    castle bits:
//      bit 16 : R castle
//      bit 17 : L castle 

typedef int move_vector;

inline int src_x(move_vector m){ return m & 7; }
inline int src_y(move_vector m){ return (m>>3) & 7; }
inline int dest_x(move_vector m){ return (m>>6) & 7; }
inline int dest_y(move_vector m){ return (m>>9) & 7; }
inline piece captured_piece(move_vector m){ return static_cast<piece>((m>>12) & 15); }
inline bool is_rcastle(move_vector m){ return m & (1<<16); }
inline bool is_lcastle(move_vector m){ return m & (1<<17); }

string pos_str(int x, int y);
string to_movestring(GameState& gs, move_vector m, bool shorthand=false);

void apply_move(GameState& gs, move_vector m);
void undo_move(GameState& gs, move_vector m);

bool is_checked(GameState& gs, int x, int y, color attacker);




# endif // GAME_LOGIC_H
