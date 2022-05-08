#ifndef CHESSNET_CONFIG_H
#define CHESSNET_CONFIG_H

#include <string>

    const std::string SERVE_X_INPUT = "chessnet_serve_x:0";

    const std::string SERVE_PI_OUTPUT = "StatefulPartitionedCall_1:0";
    const std::string SERVE_V_OUTPUT = "StatefulPartitionedCall_1:1";

    const std::string TRAIN_X_INPUT = "chessnet_train_x:0";
    const std::string TRAIN_Y_PI_INPUT = "chessnet_train_pi:0";
    const std::string TRAIN_Y_V_INPUT = "chessnet_train_v:0";

    const std::string TRAIN_V_LOSS_OUTPUT = "StatefulPartitionedCall_2:0";
    const std::string TRAIN_PI_LOSS_OUTPUT = "StatefulPartitionedCall_2:1";
    const std::string TRAIN_TOTAL_LOSS_OUTPUT = "StatefulPartitionedCall_2:2";

    const std::string VALIDATE_X_INPUT = "chessnet_validate_x:0";
    const std::string VALIDATE_Y_PI_INPUT = "chessnet_validate_pi:0";
    const std::string VALIDATE_Y_V_INPUT = "chessnet_validate_v:0";

    const std::string VALIDATE_V_LOSS_OUTPUT = "StatefulPartitionedCall_3:0";
    const std::string VALIDATE_PI_LOSS_OUTPUT = "StatefulPartitionedCall_3:1";
    const std::string VALIDATE_TOTAL_LOSS_OUTPUT = "StatefulPartitionedCall_3:2";


#endif /* CHESSNET_CONFIG_H */