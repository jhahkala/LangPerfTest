#include <iostream>     // std::cout
#include <fstream>      // std::ifstream
#include <sys/time.h>
#include <stdlib.h>
long long current_timestamp() {
    struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    long long milliseconds = te.tv_sec*1000LL + te.tv_usec/1000; // caculate milliseconds
    // printf("milliseconds: %lld\n", milliseconds);
    return milliseconds;
}

void handleFile(char *in, char *out){
  std::ifstream is (in, std::ifstream::binary);
  char * buffer;
  int length;
  if (is) {
    // get length of file:
    is.seekg (0, is.end);
    length = is.tellg();
    is.seekg (0, is.beg);

    buffer = new char [length];

    //    std::cout << "Reading " << length << " characters... " << in;
    std::cout << current_timestamp() << ";";
    // read data as a block:
    is.read (buffer,length);

    if (!is)
      std::cout << "error: only " << is.gcount() << " could be read";
    is.close();
    // ...buffer contains the entire file...

  } else {
     exit(1);
  }
  std::cout << current_timestamp() << ";";
  std::ofstream os (out, std::ofstream::binary);
  if (os) {

    //    std::cout << "Writing " << length << " characters... " << out;
    // read data as a block:
    os.write (buffer,length);

    if (!is)
      std::cout << "error: only " << is.gcount() << " could be written";
    os.close();
    // ...buffer contains the entire file...

  } else {
    exit(1);
  }
  
  std::cout << current_timestamp() << "\n";

  delete[] buffer;

}

int main (int argc, char* argv[]) {
  if (argc != 2) {
    std::cout << "Usage: "<< argv[0] <<" <pathname>\n";
    exit(2);
  }

  char filename[80];
  char fileout[80];
  int i = 0;
  for (i=0; i <= 999; i++){
    snprintf(filename, sizeof filename, "%s%s%03d%s", argv[1], "/small", i, ".rnd");
    snprintf(fileout, sizeof fileout, "%s%s", filename, ".out");
    handleFile(filename, fileout);
    
  }
  snprintf(filename, sizeof filename, "%s%s", argv[1], "/big.rnd");  
  snprintf(fileout, sizeof fileout, "%s%s", filename, ".out");
   handleFile(filename, fileout);
  
  
  
  return 0;
}

