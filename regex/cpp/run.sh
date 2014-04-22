g++ --version
/usr/bin/g++ -c -pipe -O3 -fomit-frame-pointer -march=native  -fopenmp regex.cpp -o regexdna.gpp-4.c++.o &&  \
        /usr/bin/g++ regexdna.gpp-4.c++.o -o regexdna.gpp-4.gpp_run -fopenmp -lboost_regex 

time ./regexdna.gpp-4.gpp_run 0 < ../../regexdna-input5000000.txt
