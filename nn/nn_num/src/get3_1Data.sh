#!/bin/sh

for i in `seq 100 100 1000`;
do
./nn_num $i < ./command2.txt| tail -n +208 | sed -e "s/  */ /g" | sed -n "s/i/i/gp" > ./report3_1/result/outS${i}.txt
done
