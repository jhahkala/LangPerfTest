#!/bin/bash
time java  -server -XX:+TieredCompilation -XX:+AggressiveOpts regexdna 0 < ../../regexdna-input5000000.txt
