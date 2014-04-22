gcc --version
/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -pthread -I/usr/include/tcl8.6 `pkg-config --cflags --libs glib-2.0` regex.c -o regexdna.gcc_run -ltcl8.6 -lglib-2.0

time ./regexdna.gcc_run 0 < ../../regexdna-input5000000.txt
