gcc --version
/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -pthread thread.c -o threadring.gcc-2.gcc_run 

time ./threadring.gcc-2.gcc_run 50000000
