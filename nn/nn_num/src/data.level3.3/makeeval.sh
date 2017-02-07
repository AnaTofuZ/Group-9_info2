#!/bin/sh

TARGET=$1

for i in `seq  1 10`; do
    cp learn$TARGET.txt eval$TARGET-$i.txt
done
