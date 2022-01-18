#ifndef MCTS_H
#define MCTS_H

#include <unordered_map>
#include <vector>
#include <map>
#include <random>

using namespace std;

struct MCTSNode {

    unsigned int visit_count;
    vector<double> prior;
    vector<unsigned int> action_counts;
    vector<unsigned int> action_q_values;

    MCTSNode(vector<double>& prior){
        int n_actions = prior.size();
        this->visit_count = 0;
        this->prior = prior;
        this->action_counts = vector<unsigned int>(n_actions, 0);
        this->action_q_values = vector<unsigned int>(n_actions, 0);
    }
};

// S = state of MC search
// D = state 'delta' type (to apply/undo operations fast)
template<typename S, typename D>
class MCTS {
protected:
    S state;
    double noise;

    // TODO: do I really need to keep track of search path?
    vector<D> search_path;
    vector<int> search_path_indices;
    unordered_map<size_t,MCTSNode> tree;
    unordered_map<size_t,double> terminal_nodes;

public:

    virtual bool get_state_actions(vector<D>& actions) = 0;
    virtual double get_state_action_estimates(vector<D>& actions, vector<double>& prob_estimates) = 0;
    virtual void apply_state_action(D d) = 0;
    virtual void undo_state_action(D d) = 0;
    virtual double get_final_state_value() = 0;
    virtual size_t hash_state() = 0;
    virtual double action_objective_function(MCTSNode& node, int action) = 0;
    
    MCTS(S& s);

    void run(int n_simulations);
    
    void clear_cache();

    bool get_state_action_distribution(vector<double>& probs);
    
    bool get_state_action_Q_values(vector<double>& q_values);

    S& get_state(){ return this->state; }

};

// include implementation file:
#include "mcts.tpp"

#endif // MCTS_H
