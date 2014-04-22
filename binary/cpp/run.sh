g++ --version
/usr/bin/g++ -c -pipe -O3 -fomit-frame-pointer -march=native  -fopenmp -I/usr/include/apr-1.0 binary.cpp -o binarytrees.gpp-7.c++.o &&  \
        /usr/bin/g++ binarytrees.gpp-7.c++.o -o binarytrees.gpp-7.gpp_run -fopenmp -lapr-1 

time ./binarytrees.gpp-7.gpp_run 20
