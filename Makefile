debug:
	g++ -g -Wall -std=c++17 -fsanitize=address -o ./bin/main_debug ./chess/*.cpp ./*.cpp

release:
	g++ -O3 -o ./bin/main ./chess/*.cpp ./*.cpp
