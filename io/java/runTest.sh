#!/bin/bash
time java  -server -XX:+TieredCompilation -XX:+AggressiveOpts IOTest ..
