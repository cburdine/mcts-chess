#include "mcts.h"
#include <vector>
#include <cmath>
#include <cassert>

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

            // check if the state is a leaf node:
            if(tree_ptr == tree.end()){

                new_actions.clear();
                new_probs.clear();

                auto terminal_node_ptr = terminal_nodes.find(h);
                if(terminal_node_ptr != terminal_nodes.end()){
                    value = terminal_node_ptr->second;
                    break;
                } else if(get_state_action_values(new_actions, new_probs, value)){
                    assert(new_actions.size() == new_probs.size());
                    tree_ptr = tree.emplace(new_probs);

                } else {
                    // we've reached a new terminal state:
                    value = get_final_state_value();
                    break;
                }
            }

            // select action that maximizes the UCB:
            double best_ucb = -1E+36;
            double ucb;
            int best_action = -1;

            for(int i = 0; i < new_actions.size(); ++i){
                ucb = compute_ucb(tree_ptr->second,i);
                if(ucb > best_ucb){
                    best_ucb = ucb;
                    best_action = i;
                }
            }

            // apply action:
            assert(best_action >= 0);
            action = new_actions[best_action];
            search_path.push_back(action);
            search_path_indices.push_back(best_action);
            apply_state_action(action);
        }

        // unwind search path and backpropagate Q values:
        while(!search_path.empty()){
            action = search_path.pop_back();
            int index = search_path_indices.pop_back();

            undo_state_action(action);
            auto h = hash_state(state);
            auto tree_ptr = tree.find(h);
            assert(tree_ptr != tree.end());

            // backpropagate Q values:
            double action_q = tree_ptr->second.action_q_values[index];
            double action_count = static_cast<double>(tree_ptr->second.action_count[index]);
            tree_ptr->second.action_q_values[index] = 
                (action_count*action_q + value) / 
                (action_count + 1.0);
            ++(tree_ptr->second.action_counts[index]);
            ++(tree_ptr->second.visit_count);
        }
    }
}

template<typename S, typename D>
double MCTS<S,D>::compute_ucb(MCTSNode& node, int action_idx){
    return node.action_q_values[action_idx] + 
            noise * node.prior[action_idx] * sqrt(static_cast<double>(node.visit_count)) / 
            static_cast<double>(node.action_counts[action_idx] + 1);
}

