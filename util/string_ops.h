#ifndef UTIL__STRING_OPS_H
#define UTIL__STRING_OPS_H

#include <string>  
#include <vector> 
#include <iostream>

/*
 * Python-like strip() and split() functions for C++
 *  
*/

namespace util {
	inline std::string strip(const std::string &str,std::string ch=" "){
		unsigned int i = 0;
		while (ch.find(str[i]) != std::string::npos)
			i++;
		unsigned int j = str.size() - 1;
		while (ch.find(str[j]) != std::string::npos)
			j--;		
		return str.substr(i, j+1 -i );
	}
}

#endif // UTIL__STRING_OPS_H