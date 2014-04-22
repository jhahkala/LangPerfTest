gcc --version
/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -fopenmp -mfpmath=sse -msse2 spectra.c -o spectralnorm.gcc-5.gcc_run -lm

time ./spectralnorm.gcc-5.gcc_run 5500
