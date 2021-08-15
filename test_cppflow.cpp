#include <iostream>

#include "cppflow/ops.h"
#include "cppflow/model.h"

using namespace std;

int main() {

    auto input = cppflow::fill({10, 8, 8, 6}, 1.0f);
    cppflow::model model("jupyter/simple_chess_net");
    cout << input << endl;
    // for(auto op : model.get_operations()){ cout << op << endl; }
    auto output = model({{"serving_default_input_3:0", input}},{"StatefulPartitionedCall:0", "StatefulPartitionedCall:1"});

    cout << output[0] << endl;
    cout << output[1] << endl;

    return 0;
}