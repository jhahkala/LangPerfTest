javac ./fasta.java
java  -server -XX:+TieredCompilation -XX:+AggressiveOpts fasta 5000000 >regexdna-input5000000.txt
