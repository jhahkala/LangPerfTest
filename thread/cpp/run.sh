g++ --version
/usr/bin/g++ -c -pipe -O3 -fomit-frame-pointer -march=native -pthread  thread.cpp -o threadring.gpp-5.c++.o &&  \
        /usr/bin/g++ threadring.gpp-5.c++.o -o threadring.gpp-5.gpp_run -lboost_system -lpthread 

time ./threadring.gpp-5.gpp_run 50000000
