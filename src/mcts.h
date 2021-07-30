#ifndef MCTS_H
#define MCTS_H

#include <stack>

using namespace std;

// S = state of MC search
// D = state 'delta' type
template<typename S, typename D>
class MCTSAgent {
protected:

    S state;
    stack<D> deltas; 

public:

    virtual void apply_state_delta(D d, S& s) = 0 ;
    virtual void undo_state_delta(D d, S& s) = 0;
    virtual void is_final_state(S& s) = 0;
    virtual void score_policy(S& s) = 0;
};
#endif // MCTS_H
