#include "mcts.h"
#include <vector>
#include <set>
#include <cmath>
#include <cassert>
#include <iostream>
#include <algorithm>

template<typename S, typename D>
MCTS<S,D>::MCTS(S& s){
    this->state = s;
    
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
    size_t root_hash = hash_state();

    // perform n simulations:
    for(int n = 0; n < n_simulations; ++n){
        
        // inialize root state:
        state = root_state;

        // begin searching for a leaf (or terminal) node:
        while(true){

            new_actions.clear();
            new_probs.clear();

            auto h = hash_state();
            auto tree_ptr = tree.find(h);


            // check if the state is a leaf node:
            if(tree_ptr == tree.end()){

                auto terminal_node_ptr = terminal_nodes.find(h);
                if(terminal_node_ptr != terminal_nodes.end()){
                    value = terminal_node_ptr->second;
                } else if(get_state_actions(new_actions)){
                    value = get_state_action_estimates(new_actions, new_probs);
                    assert(new_actions.size() == new_probs.size());
                    auto insertion = tree.emplace(h, new_probs);
                    tree_ptr = insertion.first;
                } else {
                    // handle if we've reached a new terminal state:
                    value = get_final_state_value();
                    terminal_nodes.emplace(h, value);
                }
                break;
            }
            
            // recall previous prior estimates from cache:
            if(get_state_actions(new_actions)){
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

            // select action that maximizes the action objective function (i.e. UCB):
            double best_obj = -1E+36;
            double obj;
            best_actions.clear();

            for(unsigned int i = 0; i < new_actions.size(); ++i){
                obj = action_objective_function(tree_ptr->second,i);
                if(obj >= best_obj){
                    if(obj > best_obj){
                        best_actions.clear();
                        best_obj = obj;
                    }
                    best_actions.push_back(i);
                }
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
            auto h = hash_state();
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

    state = root_state;
}

template<typename S, typename D>
void MCTS<S,D>::clear_cache(){
    tree.clear();
    terminal_nodes.clear();
}

template<typename S, typename D>
bool MCTS<S,D>::get_state_action_distribution(vector<double>& probs){
    auto tree_ptr = tree.find(hash_state());
    if(tree_ptr == tree.end()){
        return false;
    }

    probs.clear();
    double visit_count = static_cast<double>(tree_ptr->second.visit_count);
    assert(tree_ptr->second.action_counts.size() > 0);
    for(unsigned int n : tree_ptr->second.action_counts){
        probs.push_back(static_cast<double>(n)/visit_count);
    }
    return true;
}

template<typename S, typename D>
bool MCTS<S,D>::get_state_action_Q_values(vector<double>& q_values){
    auto tree_ptr = tree.find(hash_state());
    if(tree_ptr == tree.end()){
        return false;
    }

    q_values.clear();
    assert(tree_ptr->second.action_q_values.size() > 0);
    for(double q : tree_ptr->second.action_q_values){
        q_values.push_back(q);
    }
    return true;
}
