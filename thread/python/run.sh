python3.3 --version
python3.3 -OO -c "from py_compile import compile; compile('thread.py')"

time python3.3 thread.py 50000000
