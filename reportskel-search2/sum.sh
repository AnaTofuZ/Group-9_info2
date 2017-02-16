#!/bin/sh
#各seed値のiterationごとのerrorをまとめる

n=1
for i in $(cat err-$1.txt)
#errorの行数分まわす
   do
#rm ave-${n}.txt
   cat err-$1.txt| tail -r | tail -${n} | tail -r | tail -1 >> ave-${n}.txt
#平均を取るためにiterationごとに全seed値のerrorをまとめる
   n=$(($n + 1))
   done
