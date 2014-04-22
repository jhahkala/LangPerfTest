#!/bin/bash

for n in {000..999}; do
    dd if=/dev/urandom of=small${n}.rnd bs=10k count=100
done

dd if=/dev/urandom of=big.rnd bs=1G count=1
