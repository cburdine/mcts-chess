#ifndef MCTS_H
#define MCTS_H

#include <unordered_map>

using namespace std;

struct MCTSNode {

    unsigned int visit_count;
    vector<double> prior;
    vector<unsigned int> action_counts;
    vector<unsigned int> action_q_values;
    vector<MCTSNode*> children;

    MCTSNode(vector<double>& prior){
        int n_actions = prior.size();
        this->visit_count = 0;
        this->prior = prior;
        this->action_counts = vector<unsigned int>(n_actions, 0);
        this->action_q_values = vector<unsigned int>(n_actions, 0);
    }
};

// S = state of MC search
// D = state 'delta' type
template<typename S, typename D>
class MCTS {
protected:
    S state;
    double noise;
    vector<D> search_path;
    vector<int> search_path_indices;
    unordered_map<size_t,MCTSNode> tree;
    unordered_map<size_t, double> terminal_nodes;

public:

    virtual bool get_state_action_values(vector<D>& actions, vector<double>& probs, double& value) = 0;
    virtual void apply_state_action(D d) = 0;
    virtual void undo_state_action(D d) = 0;
    virtual double get_final_state_value() = 0;
    virtual size_t hash_state(S& s) = 0;
    
    MCTS(S& s, double noise=1.0);

    void run(int n_simulations);

private:

    double compute_ucb(MCTSNode& node, int action);
};

// include implementation file:
#include "mcts.tpp"

#endif // MCTS_H
