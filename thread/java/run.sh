java -version
javac threadring.java

time java  -server -XX:+TieredCompilation -XX:+AggressiveOpts threadring 50000000
