
#ifndef BF_HPP
#define BF_HPP

#include <bits/stdc++.h>

#define MAX_SIZE 50000

/*
 * @brief Class that implement the BF++ interpreter
 */
class BF {
    std::vector<int8_t> v;
    const int max_size = 50000;
    int i=0;

    BF();

    ~BF();

    /*
     * @brief Runs the parser.
     */
    void run(const string &s, int p);
};


#endif // BF_HPP
