#!/bin/sh

resultfile="./seachParamResult.txt"

gcc -o rewriteVarParam rewriteVarParam.c
echo "" > $resultfile
for eta in `seq 0.00 0.01 1.99`
do
  for alpha in `seq 0.00 0.01 1.99`
  do
	for hidden in `seq 1 15`
	do
	  ./rewriteVarParam $eta $alpha $hidden
	  gcc -Wall -O2 -c -o num.o num.c
	  gcc -o nn_num num.o sigmoid.o set_problem.o -lm

	  #./nn_num 1000 < command2.txt | tail -n 2 | head -n 1 | cut -d ' ' -f3
	  echo eta ${eta} alpha ${alpha} hidden ${hidden} >> $resultfile
	  ./nn_num 1000 < command2.txt | tail -n 2 | head -n 1 >> $resultfile
	done
  done
done

# ベクター形式で出力して
