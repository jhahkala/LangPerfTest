gcc --version
/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -std=c99 -pthread binary.c -o binarytrees.gcc_run -lm
time ./binarytrees.gcc_run 20
