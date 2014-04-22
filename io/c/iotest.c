/*************************************************************************
 * main()
 *************************************************************************/
#include <errno.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <sys/time.h>

long long current_timestamp() {
    struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    long long milliseconds = te.tv_sec*1000LL + te.tv_usec/1000; // caculate milliseconds
    // printf("milliseconds: %lld\n", milliseconds);
    return milliseconds;
}

void handleFile(FILE *file, FILE *outfile){
    char* block = NULL;
    size_t rcount = 0;
    struct stat sb;
    int fd = fileno(file);
    fstat(fd, &sb);
    size_t block_size = sb.st_size;
    //printf("File size:                %lld bytes\n",
    //                   (long long) sb.st_size);

    /* Allocate a block for I/O. */
    block = malloc(block_size);
    if (block == NULL) {
        perror("malloc");
        exit(1);
    }
    
    /* Iterate over each block of input. */
    long long timestamp = current_timestamp();
    printf("%lld;", timestamp);
    /* Read a block. */
    rcount = fread(block, 1, block_size, file);
    if (rcount != block_size) {
      /* Check for errors. */
      if (ferror(file)) {
	perror("fread");
	exit(1);
      }
      /* EOF */
    } else {
      //	  printf("%d", rcount);
    }
timestamp = current_timestamp();
    printf("%lld;", timestamp);
    rcount = fwrite(block, 1, block_size, outfile);
    if (rcount != block_size) {
      /* Check for errors. */
      if (ferror(file)) {
	perror("fwrite");
	exit(1);
      }
      /* EOF */
    } else {
      //	  printf("%d", rcount);
    }
timestamp = current_timestamp();
    printf("%lld\n", timestamp);
    
    
    /* Free block. */
    free(block);

}

int main(int argc, char* argv[]){
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  char filename[80];
  char fileout[80];
  int i = 0;
  for (i=0; i <= 999; i++){
    snprintf(filename, sizeof filename, "%s%s%03d%s", argv[1], "/small", i, ".rnd");
    snprintf(fileout, sizeof fileout, "%s%s", filename, ".out");
    FILE *in = fopen(filename, "r");
    if (in == NULL){
    printf("fopen Error %d %s", errno, filename);
      printf("Error %d", errno);
      exit(1);
    }
    FILE *out = fopen(fileout, "w");
    if (out == NULL){
    printf("fopen Error %d %s", errno,fileout);
      printf("Error %d", errno);
      exit(1);
    }
    handleFile(in, out);
    fclose(out);
    fclose(in);
    
  }
  snprintf(filename, sizeof filename, "%s%s", argv[1], "/big.rnd");  
  snprintf(fileout, sizeof fileout, "%s%s", filename, ".out");
  FILE *in = fopen(filename, "r");
  if (NULL == in){
    printf("fopen Error %d %s", errno, filename);
    exit(1);
  }
  //  printf("Error %d \n", in);
  FILE *out = fopen(fileout, "w");
  if (out == NULL){
    printf("fopen Error %d %s", errno, fileout);
    exit(1);
  }
   handleFile(in, out);
  
  fclose(out);
  fclose(in);
  
  
  exit(0);
}
