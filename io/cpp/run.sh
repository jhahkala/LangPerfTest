g++ --version
rm iotest.gpp_run iotest.c++.o
/usr/bin/g++ -c -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 -fopenmp -mfpmath=sse -msse2 iotest.cpp -o iotest.c++.o &&  \
/usr/bin/g++ iotest.c++.o -o iotest.gpp_run -fopenmp 

time ./iotest.gpp_run ..
