debug:
	g++ -g -Wall -std=c++17 -fsanitize=address -o ./bin/main_debug ./chess/*.cpp main.cpp

release:
	g++ -O3 -o ./bin/main ./chess/*.cpp *.cpp

test_cppflow:
	g++ -std=c++17 -o ./bin/test_cppflow ./test_cppflow.cpp -ltensorflow