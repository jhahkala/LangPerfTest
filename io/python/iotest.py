
import sys
import time

def handlefile(filename):
    print(str(round(time.time() * 1000)) + ";", end="")
    fin = open(filename, 'rb')
    buffer = fin.read()
    fin.close();
    print(str(round(time.time() * 1000)) + ";", end="")
    fout = open(filename + '.out', 'wb')
    fout.write(buffer)
    print(str(round(time.time() * 1000)))


def main():
    if len(sys.argv) != 2:
        print('usage iotest.py <directory>')
    for f in range(1000):
        handlefile(sys.argv[1]+'/small'+str(f).zfill(3)+'.rnd')
    handlefile(sys.argv[1]+'/big.rnd')
main()
