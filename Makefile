debug:
	g++ -g -Wall -std=c++17 -fsanitize=address -o ./bin/main_debug \
	./chess/*.cpp \
	chess_mcts.cpp \
	chess_game.cpp \
	main.cpp \
	-ltensorflow

release:
	g++ -fcompare-debug-second -O3 -DNDEBUG -o ./bin/main \
	./chess/*.cpp \
	chess_mcts.cpp \
	chess_game.cpp \
	main.cpp \
	-ltensorflow

test_cppflow:
	g++ -std=c++17 -o ./bin/test_cppflow ./test_cppflow.cpp -ltensorflow