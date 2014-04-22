#!/bin/bash
time java  -server -XX:+TieredCompilation -XX:+AggressiveOpts threadring 50000000
