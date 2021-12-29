#include "mcts.h"
#include <vector>
#include <cmath>
#include <cassert>
#include <iostream>
#include <algorithm>

template<typename S, typename D>
MCTS<S,D>::MCTS(S& s, double noise){
    this->state = s;
    this->noise = noise;

    this->search_path = vector<D>();
    this->search_path_indices = vector<int>();
    this->tree = unordered_map<size_t,MCTSNode>();
    this->terminal_nodes = unordered_map<size_t, double>();
}

template<typename S, typename D>
void MCTS<S,D>::run(int n_simulations){

    double value;
    vector<double> new_probs = vector<double>();
    D action;
    vector<D> new_actions = vector<D>();
    vector<unsigned int> best_actions = vector<unsigned int>();

    // record root and clear search tree:
    S root_state = state;
    tree.clear();

    // perform n simulations:
    for(int n = 0; n < n_simulations; ++n){
        
        // inialize root state:
        search_path.clear();
        search_path_indices.clear();
        state = root_state;

        // begin searching for a leaf (or terminal) node:
        while(true){

            // add state to tree:
            auto h = hash_state(state);
            auto tree_ptr = tree.find(h);

            new_actions.clear();
            new_probs.clear();

            // check if the state is a leaf node:
            if(tree_ptr == tree.end()){

                auto terminal_node_ptr = terminal_nodes.find(h);
                if(terminal_node_ptr != terminal_nodes.end()){
                    value = terminal_node_ptr->second;
                    break;
                } else if(get_state_action_values(new_actions, new_probs, value)){
                    assert(new_actions.size() == new_probs.size());
                    auto insertion = tree.emplace(h, new_probs);
                    tree_ptr = insertion.first;
                } else {
                    // handle if we've reached a new terminal state:
                    value = get_final_state_value();
                    terminal_nodes.emplace(h, value);
                    break;
                }
            
            } else {

                bool actions_exist = get_state_action_values(new_actions, new_probs, value);
                
                // recall previous prior estimates from cache:
                if(actions_exist){
                    auto old_probs = new_probs;
                    new_probs = tree_ptr->second.prior;
                    assert((new_actions.size() == new_probs.size()) && "Note: possible hashing collision occurred!");

                } else {
                    // set terminal state:
                    //     if this branch executes, then the simulation was cut short
                    //     (i.e. due to maximum recursion depth or "idling" rules)
                    value = get_final_state_value();
                    terminal_nodes.emplace(h, value);
                    break;
                }
            }

            // select action that maximizes the UCB:
            double best_ucb = -1E+36;
            double ucb;
            best_actions.clear();

            for(unsigned int i = 0; i < new_actions.size(); ++i){
                ucb = compute_ucb(tree_ptr->second,i);
                if(ucb >= best_ucb){
                    if(ucb > best_ucb){
                        best_actions.clear();
                        best_ucb = ucb;
                    }
                    best_actions.push_back(i);
                }
            }

            // move randomly:
            for(unsigned int i = 0; i < new_actions.size(); ++i){
                best_actions.push_back(i);
            }

            // apply action:
            assert(best_actions.size() >= 0);
            if(best_actions.size() > 1){ random_shuffle(best_actions.begin(),best_actions.end()); }

            unsigned int best_action = best_actions[0];
            action = new_actions[best_action];
            search_path.push_back(action);
            search_path_indices.push_back(best_action);
            apply_state_action(action);
        }

        // unwind search path and backpropagate Q values:
        while(!search_path.empty()){
            action = search_path.back();
            int index = search_path_indices.back();
            search_path.pop_back();
            search_path_indices.pop_back();

            undo_state_action(action);
            auto h = hash_state(state);
            auto tree_ptr = tree.find(h);

            assert(tree_ptr != tree.end());

            // backpropagate Q values:
            double action_q = tree_ptr->second.action_q_values[index];
            double action_count = static_cast<double>(tree_ptr->second.action_counts[index]);
            tree_ptr->second.action_q_values[index] = 
                (action_count*action_q + value) / 
                (action_count + 1.0);
            ++(tree_ptr->second.action_counts[index]);
            ++(tree_ptr->second.visit_count);
        }
    }

    cout << "# terminal nodes: " << terminal_nodes.size() << endl;
    int w_wins = 0, b_wins = 0, draws = 0;
    for(auto p : terminal_nodes){
        if(p.second > 0.0){ ++w_wins; }
        else if(p.second < 0.0){ ++b_wins; }
        else { ++draws; }
    }

    cout << "White Wins: " << w_wins << endl
         << "Black Wins: " << b_wins << endl
         << "Draws:      " << draws << endl; 
}

template<typename S, typename D>
double MCTS<S,D>::compute_ucb(MCTSNode& node, int action_idx){
    return node.action_q_values[action_idx] + 
            noise * node.prior[action_idx] * sqrt(static_cast<double>(node.visit_count)) / 
            static_cast<double>(node.action_counts[action_idx] + 1);
}

