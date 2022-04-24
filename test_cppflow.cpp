#include <iostream>
#include <iomanip>

#include "cppflow/ops.h"
#include "cppflow/model.h"

using namespace std;

int main() {

    // set batch size:
    const int BATCH_SIZE = 10;

    // Load cppflow model and print operations:
    cppflow::model model("jupyter/simple_chess_net");
    cppflow::model model2("jupyter/simple_chess_net");


    // print model operations:
    cout << "-----------------------------------------------------" << endl;
    cout << "Model Operations: " << endl;
    for(auto op : model.get_operations()){ cout << op << endl; }

    // This simulates an inference call of a batch with 10 boards:
    cout << "-----------------------------------------------------" << endl;
    cout << "Testing Inference Serving..." << endl;
    auto x_input = cppflow::fill({BATCH_SIZE, 8, 8, 6}, 1.0f);
    auto output = model({{"chessnet_serve_x:0", x_input}},{"StatefulPartitionedCall:0", "StatefulPartitionedCall:1"});

    // output policy network result:
    cout << output[0] << endl;

    // output value network result:
    cout << output[1] << endl;

    // this simulates the first 100 training steps to overfit a single data point
    cout << "-----------------------------------------------------" << endl;
    cout << "Testing training steps..." << endl;

    auto y_pi = cppflow::fill({BATCH_SIZE,64*64}, 1.0f/(64.0f*64.0f));
    auto y_v = cppflow::fill({BATCH_SIZE}, 1.0f);

    cout << setw(5) << "step"
         << setw(16) << "v loss"
         << setw(16) << "pi loss"
         << setw(16) << "net reg. loss"
         << endl;

    for(int i = 0; i < 100; ++i){
        auto loss = model({{"chessnet_train_x:0", x_input},
                       {"chessnet_train_pi:0", y_pi},
                       {"chessnet_train_v:0", y_v}},
                       {"StatefulPartitionedCall_1:0", 
                        "StatefulPartitionedCall_1:1",
                        "StatefulPartitionedCall_1:2"});

        auto v_loss_vec = cppflow::cast(loss[0],TF_FLOAT,TF_DOUBLE).get_data<double>();
        auto pi_loss_vec = cppflow::cast(loss[1],TF_FLOAT, TF_DOUBLE).get_data<double>();
        auto total_loss_vec = cppflow::cast(loss[2],TF_FLOAT,TF_DOUBLE).get_data<double>();
        cout << setw(5) << i
             << setw(16) << v_loss_vec[0] 
             << setw(16) << pi_loss_vec[0] 
             << setw(16) << total_loss_vec[0] 
             << endl;
    }

    // this tests the validation function:
    cout << "-----------------------------------------------------" << endl;
    cout << "Testing validation steps..." << endl;
    cout << setw(5) << "step"
         << setw(16) << "v loss"
         << setw(16) << "pi loss"
         << setw(16) << "net reg. loss"
         << endl;

    for(int i = 0; i < 5; ++i){
        auto loss = model({{"chessnet_validate_x:0", x_input},
                       {"chessnet_validate_pi:0", y_pi},
                       {"chessnet_validate_v:0", y_v}},
                       {"StatefulPartitionedCall_2:0", 
                        "StatefulPartitionedCall_2:1",
                        "StatefulPartitionedCall_2:2"});

        auto v_loss_vec = cppflow::cast(loss[0],TF_FLOAT,TF_DOUBLE).get_data<double>();
        auto pi_loss_vec = cppflow::cast(loss[1],TF_FLOAT, TF_DOUBLE).get_data<double>();
        auto total_loss_vec = cppflow::cast(loss[2],TF_FLOAT,TF_DOUBLE).get_data<double>();
        cout << setw(5) << i
             << setw(16) << v_loss_vec[0] 
             << setw(16) << pi_loss_vec[0] 
             << setw(16) << total_loss_vec[0] 
             << endl;
    }

    return 0;
}