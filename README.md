# MCTS Chess ♚
```
8 ♜ ♞ ♝ ♚ . ♝ . ♜
7 ♟ . # ♟ # ♟ ♟ ♟
6 . # ♟ # ♟ # . ♞
5 # . # . # . # .
4 . ♟ . # . # ♙ ♙
3 ♙ ♙ ♙ ♛ # ♙ # ♗
2 . # ♕ ♙ ♙ ♔ . #
1 ♖ ♘ ♗ . # . ♘ ♖
  a b c d e f g h

```
A GPU-accelerated Neural Network Chess Engine written in C++ with Tensorflow. The engine uses a Monte Carlo Tree Search (MCTS) reinforement learning model, with the search process pruned by a Convolutional Neural Network. This is the same approach used in the famous paper [*Mastering Chess and Shogi by Self-Play with a General Reinforcement Learning Algorithm*](https://doi.org/10.48550/arXiv.1712.01815) by Google's [DeepMind](https://www.deepmind.com/) Team.

This engine will not give [Stockfish](https://stockfishchess.org/) or [Leela Chess Zero](https://lczero.org/) a run for its money, but it is a fully-functional neural network chess engine, built with simplicity and compatibility in mind. The engine can be built and run on any system with a C++17-compatible compiler. 

This project does not require an installation of the C++ Tensorflow distribution. Instead, it uses the [Tensorflow C API](https://www.tensorflow.org/install/lang_c), which is much easier to install.

---
## Getting Started
The easiest and most reliable way to get started is to run the model in a [Docker Container](https://docs.docker.com/get-started/).
First you will need to make sure Docker is [installed on your system](https://docs.docker.com/get-docker/).

To build the mcts-chess Docker container, run the following command in the project directory:

```
docker build --no-cache -t mcts-chess:latest . 
```

Building the image may take some time. Once the image builds, it should appear with the tag `mcts-chess:latest` when you run `docker images`. 

To start the container with a bash shell prompt, run:
```
docker run -it --rm --gpus all mcts-chess bash
```

If you do not want to use gpu acceleration, omit the the `--gpus all` flag. Once the container starts, you should be inside the `/mcts-chess` directory. To start the program, simply run:
```
./bin/main
```

## Building from Source
### Dependencies
To build the project from source, you will first need to install the [Tensorflow C API](https://www.tensorflow.org/install/lang_c). If you want to use GPU acceleration (compatible with NVIDIA GPUs), be sure to download the correct Tensorflow binary with GPU support. 

Installing the C++ Tensorflow distribution from source is not needed, as this project uses [cppflow](https://github.com/serizba/cppflow), a self contained library that calls the C API.

### Compiling
Compiling the source requires GNU Make and GCC to be installed, with at least C++17 compatibility. 

To compile, simply run the `make` command (and hope for the best).

## Running the Jupyter Notebooks
### Run in a Docker Container
The easiest way to run the notebooks is through the docker container (see above). Simply starting the docker container with forwarding to port `8888` will start the Jupyter notebook server:
```
docker run -it --rm --gpus all -p 8888:8888 mcts-chess
```
The notebook server can be accessed in your browser at `http://127.0.0.1:8888/?token=...` . You will need to need to supply the access token that is displayed when the container starts.

You can omit the `--gpus all` flag if GPU support is not desired. For troubleshooting, see [Tensorflow's Docker Page](https://www.tensorflow.org/install/docker).

### Run in a Python Environment
To run the Jupyter notebooks in a regular python environment, you will need to install the dependencies with:
```
pip3 install --upgrade notebook tensorflow 
```

To start the notebook server in the current directory, run:
```
jupyter-notebook .
```

---
### TODO List:
- [x] Create a Docker Image with Dockerfile
- [x] Add a PGN file parser for training on expert games.
- [ ] Include a better Pre-Trained Model.
- [ ] Add Better Documentation to Jupyter Notebook.
- [ ] Include some examples of different nnet architectures (e.g Residual Nets)
- [ ] Implement [Rick's Method](https://youtu.be/dQw4w9WgXcQ) for rollout of states.