#!/bin/sh

etas="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9"
alphas="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9"
hiddens="1 2 3 4 5 6 7 8 9 10"
resultfile="./seachParamResult.txt"

gcc -o rewriteVarParam rewriteVarParam.c
echo "" > $resultfile
for eta in $etas
do
  for alpha in $alphas
  do
	for hidden in $hiddens
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
