debug:
	g++ -g -Wall -std=c++17 -fsanitize=address -o ./bin/main_debug ./*.cpp 

release:
	g++ -O3 -o ./bin/main ./*.cpp
