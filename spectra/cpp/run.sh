g++ --version
/usr/bin/g++ -c -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 -fopenmp -mfpmath=sse -msse2 spectra.cpp -o spectralnorm.gpp-5.c++.o &&  \
        /usr/bin/g++ spectralnorm.gpp-5.c++.o -o spectralnorm.gpp-5.gpp_run -fopenmp 

time ./spectralnorm.gpp-5.gpp_run 5500
