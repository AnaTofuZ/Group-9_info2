#!/bin/sh
#平均のグラフを作成するためのデータ集め

n=95
add=0

while [ $n -le 114 ]
do
cat ave-${n}.txt |  while read line
do
add=` echo "scale=15; $add + $line" | bc`
echo ${add}| awk '{print $1 - $100}' >> add-${n}.txt
#errorを全て加算
done
i=$(cat add-${n}.txt | tail -1)
echo "scale=15; $i/10" | bc | awk '{print $1 - $100}' >> ave.txt
average=$(cat ave.txt | tail -1)
#平均値を求める
echo $n,$average >> average.txt
#iteration,error平均値で書き出し
n=$(($n + 1))
done
