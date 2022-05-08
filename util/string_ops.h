#ifndef UTIL__STRING_OPS_H
#define UTIL__STRING_OPS_H

#include<string>  
#include<vector> 
#include <iostream>

/*
 * Python-like strip() and split() functions for C++
 *  
*/

namespace util {
	std::string strip(const std::string &str,std::string ch=" "){
		unsigned int i = 0;
		while (ch.find(str[i]) != std::string::npos)
			i++;
		unsigned int j = str.size() - 1;
		while (ch.find(str[j]) != std::string::npos)
			j--;		
		return str.substr(i, j+1 -i );
	}
	
	std::vector<std::string> split(const std::string &str, std::string ch = " "){
		// unused
		return std::vector<std::string>();
	}
}

#endif // UTIL__STRING_OPS_H