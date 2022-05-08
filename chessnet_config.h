#ifndef CHESSNET_CONFIG_H
#define CHESSNET_CONFIG_H

#include <string>

    /**
     * This is the configuration file for graph operations on the chessnet saved model
     * 
     *  To see the operations performable (and to check that this config file is correct)
     *  compile the test_cppflow target in the Makefile and run it.
     *  (The binary will be compiiled in the ./bin directory)
     * 
     *  The first thing printed by test_cppflow is a list of graph operations
     *  at the end of the list are a sequence of arguments followed by the exported
     *  operation name (of the form "StatefulPartitionedCall*"). You can identify each function
     *  by its preceding arguments, which are exported according to their name as python arguments:
     * 
     *  Argument names: "<exported func name>_<python arg name>"
     * 
     *  When changes are made to the model in the Jupyter Notebook, you may need to edit the config file
     *  here accordngly, as functions are exported in alphabetical order.
     */

    /* Serve operation */
    const std::string SERVE_X_INPUT = "chessnet_serve_x:0";
    
    const std::string SERVE_PI_OUTPUT = "StatefulPartitionedCall_2:0";
    const std::string SERVE_V_OUTPUT = "StatefulPartitionedCall_2:1";

    /* Train Step Operation */
    const std::string TRAIN_X_INPUT = "chessnet_train_x:0";
    const std::string TRAIN_Y_PI_INPUT = "chessnet_train_pi:0";
    const std::string TRAIN_Y_V_INPUT = "chessnet_train_v:0";

    const std::string TRAIN_V_LOSS_OUTPUT = "StatefulPartitionedCall_3:0";
    const std::string TRAIN_PI_LOSS_OUTPUT = "StatefulPartitionedCall_3:1";
    const std::string TRAIN_TOTAL_LOSS_OUTPUT = "StatefulPartitionedCall_3:2";

    /* Validate Operation */
    const std::string VALIDATE_X_INPUT = "chessnet_validate_x:0";
    const std::string VALIDATE_Y_PI_INPUT = "chessnet_validate_pi:0";
    const std::string VALIDATE_Y_V_INPUT = "chessnet_validate_v:0";

    const std::string VALIDATE_V_LOSS_OUTPUT = "StatefulPartitionedCall_4:0";
    const std::string VALIDATE_PI_LOSS_OUTPUT = "StatefulPartitionedCall_4:1";
    const std::string VALIDATE_TOTAL_LOSS_OUTPUT = "StatefulPartitionedCall_4:2";

    /* Save Checkpoint Operation */
    const std::string SAVE_CHECKPOINT_PATH_INPUT = "chessnet_save_checkpoint_path:0";
    
    const std::string SAVE_CHECKPOINT_PATH_OUTPUT = "StatefulPartitionedCall_1:0";

    /* Save Model Operation */
    const std::string SAVE_MODEL_PATH_INPUT = "saver_filename:0";
    
    const std::string SAVE_MODEL_PATH_OUTPUT = "StatefulPartitionedCall_5:0";

    /* Reset Optimizer Operation */
    const std::string RESET_OPTIMIZER_OPTIONS_INPUT = "chessnet_reset_optimizer_options:0";

    const std::string RESET_OPTIMIZER_OPTIONS_OUTPUT = "StatefulPartitionedCall";


#endif /* CHESSNET_CONFIG_H */