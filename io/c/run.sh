gcc --version
rm iotest.gcc_run
/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -pthread iotest.c -o iotest.gcc_run 

time ./iotest.gcc_run ..
