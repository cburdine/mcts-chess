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

        if(str.size() <= 0){ return str; }

		unsigned int i = 0;
		while (i < str.size() && ch.find(str[i]) != std::string::npos)
			i++;
		unsigned int j = str.size();
		while (j > 0 && ch.find(str[j-1]) != std::string::npos)
			j--;
		return str.substr(i, j);
	}
}

#endif // UTIL__STRING_OPS_H