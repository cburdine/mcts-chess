FROM tensorflow/tensorflow:latest-gpu-jupyter

# This is the version of the tensorflow C API that is built:
ARG TF_C_FILENAME=libtensorflow-gpu-linux-x86_64-2.7.0.tar.gz

# Build the Tensorflow C API from source:
RUN apt install wget
RUN wget -q --no-check-certificate https://storage.googleapis.com/tensorflow/libtensorflow/${TF_C_FILENAME}
RUN tar -C /usr/local -xzf ${TF_C_FILENAME}
RUN ldconfig /usr/local/lib

RUN apt install nvidia-modprobe

# create project directory:
ADD . /mcts-chess
WORKDIR /mcts-chess

# build test_cppflow binary:
RUN make test_cppflow
RUN ./bin/test_cppflow

# build main and main_debug binaries:
RUN make debug    # <-- builds debug version
RUN make release  # <-- builds release version
