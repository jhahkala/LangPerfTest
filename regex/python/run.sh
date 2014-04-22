python3.3 --version
python3.3 -OO -c "from py_compile import compile; compile('regex.py')"

time python3.3 regex.py 0 < ../../regexdna-input5000000.txt
