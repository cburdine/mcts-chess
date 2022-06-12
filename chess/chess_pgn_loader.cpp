#include <fstream>
#include <string>
#include <sstream>
#include <iostream>
#include <array>

#include "chess_pgn_loader.h"
#include "chess_game.h"
#include "chess_game_state.h"
#include "util/string_ops.h"

PGNLoader::PGNLoader(string path){
    this->path = path;
    this->size = 0;
    pgn_in = ifstream();
    pgn_in.open(this->path);
    assert(pgn_in);
    

    // determine the size of the file:
    if(pgn_in){
        while(seek_next_game()){ ++(this->size); }
    }
}

bool PGNLoader::seek_next_game(){
    // jump to first index:
    string token;
    while(pgn_in >> token){
        assert(token.size() > 0);

        // handle game metadata and comments:
        if(token[0] == '['){
            while(pgn_in && token[token.size()-1] != ']'){ pgn_in >> token; }
        } else if(token[0] == '{'){
            while(pgn_in && token[token.size()-1] != '}'){ pgn_in >> token; }
        } else if(token[0] == ';'){
            getline(pgn_in, token);
        } else {
            // identify first line of game:
            token = util::strip(token);
            if(token == "1."){ break; }
        }
    }

    return bool(pgn_in);
}


unsigned int PGNLoader::get_training_data(
                            chessnet_dataset& dataset, 
                            int start_idx, int end_idx){

    // perform index sanity check:
    if(start_idx < 0){ start_idx += this->size; }
    if(end_idx < 0){ end_idx += this->size; }
    if(start_idx > end_idx || end_idx >= static_cast<int>(this->size)){
        assert(start_idx >= 0);
        assert(start_idx <= end_idx);
        assert(end_idx < static_cast<int>(this->size));
        return 0;
    }

    // find game at start index:
    pgn_in.clear();
    pgn_in.seekg(0, ios::beg);
    for(int i = 0; i <= start_idx; ++i){
        seek_next_game(); 
    }

    // parse games:
    unsigned int n_games_parsed = 0;
    for(int i = start_idx; i < end_idx && pgn_in; ++i){

        vector<string> w_moves, b_moves;
        double outcome = 0.0;
        if(parse_game_moves(w_moves, b_moves, outcome) &&
           simulate_game(w_moves, b_moves, outcome, dataset)){
            ++n_games_parsed;
        }
        seek_next_game();
    }

    return n_games_parsed;
}

bool PGNLoader::parse_game_moves(vector<string>& w_moves,
                          vector<string>& b_moves,
                          double& outcome){
    string token;
    color turn = WHITE;
    while(pgn_in >> token){

        token = util::strip(token);
        // ignore inline comments (if any)
        if(token[0] == '['){
            while(pgn_in && token[token.size()-1] != ']'){ pgn_in >> token; }
            continue;
        } else if(token[0] == '{'){
              while(pgn_in && token[token.size()-1] != '}'){ pgn_in >> token; }
              continue;
        } else if(token[0] == ';'){
            getline(pgn_in, token);
            continue;
        } else if(token[token.size()-1] == '.'){
            continue;
        }

        // check for end of game:
        if(token == "0-1"){ 
            outcome = -1.0; 
            return bool(pgn_in); 
        } else if(token == "1/2-1/2" || token == "*"){ 
            outcome = 0.0; 
            return bool(pgn_in); 
        } else if(token == "1-0"){ 
            outcome = 1.0; 
            return bool(pgn_in);
        }
        
        // parse game move:
        if(turn == WHITE){
            w_moves.push_back(token);
        } else {
            b_moves.push_back(token);
        }
        turn = !turn;
    }

    return bool(pgn_in);
}

void PGNLoader::add_move_data(GameState& gs, move_vector m, 
                    double outcome, 
                    chessnet_dataset& dataset){
    
    unsigned int move_idx = (src_y(m)<<9) | (src_x(m)<<6) | (dest_y(m)<<3) | dest_x(m);
    array<double,64*64> probs;
    probs.fill(0.0);
    probs[move_idx] = 1.0;

    dataset.emplace_back(gs.board, probs, outcome);
}

bool PGNLoader::simulate_game(vector<string>& w_moves,
                    vector<string>& b_moves,
                    double& outcome,
                    chessnet_dataset& dataset){

    GameState gs = GameState();
    chessnet_dataset game_data;

    color next_turn = WHITE;
    for(unsigned int i = 0; i < w_moves.size(); ++i){
        move_vector m;
        bool valid_move_found = parse_text_move(m, gs, WHITE, w_moves[i]);
        assert(valid_move_found);
        add_move_data(gs,m,outcome,game_data);
        apply_move(gs, m);
        next_turn = BLACK;

        if(i < b_moves.size()){
            valid_move_found = parse_text_move(m, gs, BLACK, b_moves[i]);
            assert(valid_move_found);
            add_move_data(gs,m,outcome,game_data);
            apply_move(gs, m);
            next_turn = WHITE;
        }

    }

    // ensure no valid moves remain (or a draw resulted):
    vector<move_vector> moves = get_valid_moves(gs, next_turn);

    if(b_checkmate(gs.state)){
        assert(outcome > 0.5);
        assert(moves.size() == 0);
        return false;
    } else if(b_checkmate(gs.state)){
        assert(outcome < -0.5);
        assert(moves.size() == 0);
        return false;
    }

    // add new data to dataset:
    for(auto d : game_data){ dataset.push_back(d); }
    return true;
}