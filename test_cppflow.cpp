#include <iostream>
#include <iomanip>

#include "cppflow/ops.h"
#include "cppflow/model.h"
#include "chessnet_config.h"

using namespace std;

int main() {

    // set batch size:
    const int BATCH_SIZE = 10;

    // Load cppflow model and print operations:
    cppflow::model model("jupyter/simple_chess_net_v2");
    cppflow::model model2("jupyter/simple_chess_net");


    // print model operations:
    cout << "-----------------------------------------------------" << endl;
    cout << "Model Operations: " << endl;
    for(auto op : model.get_operations()){ cout << op << endl; }

    // This simulates an inference call of a batch with 10 boards:
    cout << "-----------------------------------------------------" << endl;
    cout << "Testing Inference Serving..." << endl;
    auto x_input = cppflow::fill({BATCH_SIZE, 8, 8, 6}, 1.0f);
    auto output = model({{SERVE_X_INPUT, x_input}},{SERVE_PI_OUTPUT, SERVE_V_OUTPUT});

    // output policy network result:
    cout << output[0] << endl;

    // output value network result:
    cout << output[1] << endl;

    // This attempts to reset the ADAM optimizer moments to 0:
    cout << "-----------------------------------------------------" << endl;
    cout << "Testing Optimizer Reset..." << endl;
    auto opts_input = cppflow::tensor(std::string(""));
    model({{RESET_OPTIMIZER_OPTIONS_INPUT, opts_input}},
           {RESET_OPTIMIZER_OPTIONS_OUTPUT});
    
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
        auto loss = model({{TRAIN_X_INPUT, x_input},
                       {TRAIN_Y_PI_INPUT, y_pi},
                       {TRAIN_Y_V_INPUT, y_v}},
                       {TRAIN_V_LOSS_OUTPUT, 
                        TRAIN_PI_LOSS_OUTPUT,
                        TRAIN_TOTAL_LOSS_OUTPUT});

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
        auto loss = model({{VALIDATE_X_INPUT, x_input},
                       {VALIDATE_Y_PI_INPUT, y_pi},
                       {VALIDATE_Y_V_INPUT, y_v}},
                       {VALIDATE_V_LOSS_OUTPUT, 
                        VALIDATE_PI_LOSS_OUTPUT,
                        VALIDATE_TOTAL_LOSS_OUTPUT});

        auto v_loss_vec = cppflow::cast(loss[0],TF_FLOAT,TF_DOUBLE).get_data<double>();
        auto pi_loss_vec = cppflow::cast(loss[1],TF_FLOAT, TF_DOUBLE).get_data<double>();
        auto total_loss_vec = cppflow::cast(loss[2],TF_FLOAT,TF_DOUBLE).get_data<double>();
        cout << setw(5) << i
             << setw(16) << v_loss_vec[0] 
             << setw(16) << pi_loss_vec[0] 
             << setw(16) << total_loss_vec[0] 
             << endl;
    }

    cout << "-----------------------------------------------------" << endl;
    cout << "Testing checkpoint saving...." << endl;
    auto f_input = cppflow::tensor(std::string("test/checkpoint"));
    cout << f_input << endl;
    model({{SAVE_CHECKPOINT_PATH_INPUT, f_input}},
           {SAVE_CHECKPOINT_PATH_OUTPUT});

    cout << "-----------------------------------------------------" << endl;
    cout << "Testing model saving...." << endl;
    auto f_in = cppflow::tensor(std::string("test/variables"));
    cout << f_in << endl;
    model({{SAVE_MODEL_PATH_INPUT, f_in}},{SAVE_MODEL_PATH_OUTPUT});
    
    return 0;
}