debug:
	g++ -g -Wall -std=c++17 -fsanitize=address -o ./bin/main_debug \
	./chess/*.cpp \
	chess_mcts.cpp \
	chess_game.cpp \
	main.cpp \
	-ltensorflow \
	-I .

release:
	g++ -std=c++17 -fcompare-debug-second -O3 -DNDEBUG -o ./bin/main \
	./chess/*.cpp \
	chess_mcts.cpp \
	chess_game.cpp \
	main.cpp \
	-ltensorflow \
	-I .

test_cppflow:
	g++ -std=c++17 -o ./bin/test_cppflow ./test_cppflow.cpp -ltensorflow