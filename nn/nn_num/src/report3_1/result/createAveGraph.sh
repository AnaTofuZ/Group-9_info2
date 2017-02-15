#!/bin/sh

accumuFile="average.txt"
outputfile="averageGpath.pdf"
outputfile2="averageGpath2.pdf"
outputfile3="allSeedGpath.pdf"
outputfile4="allSeedGpath2.pdf"


gnuplot <<EOF
set datafile separator " "
set title 'Level3.1 重みを更新する様子 (平均値)'
set xlabel 'Iterations'
set ylabel 'Errors'
set terminal pdf font "MigMix 2M,14"
set output '$outputfile'
plot '$accumuFile' using 1:2 with line title 'Level3.1  平均値'
EOF
echo "$outputfile にグラフ作成完了!!!"
open $outputfile

gnuplot <<EOF
set datafile separator " "
set title 'Level3.1 重みを更新する様子 (平均値)'
set xlabel 'Iterations'
set ylabel 'Errors'
set terminal pdf font "MigMix 2M,14"
set output '$outputfile2'
plot '$accumuFile' every ::::50 using 1:2 with line title 'Level3.1  平均値'
EOF
echo "$outputfile2 にグラフ作成完了!!!"
open $outputfile2

gnuplot <<EOF
set datafile separator " "
set title 'Level3.1 重みを更新する様子 全seed値 '
set xlabel 'Iterations'
set ylabel 'Errors'
set terminal pdf font "MigMix 2M,14"
set output '$outputfile3'
plot 'outS100.txt' using 3:6 with line lc rgb "black" title 'Level3.1 seed100',\
 'outS200.txt' using 3:6 with line lc rgb "gray" title 'Level3.1  seed200',\
 'outS300.txt' using 3:6 with line lc rgb "red" title 'Level3.1  seed300',\
 'outS400.txt' using 3:6 with line lc rgb "yellow" title 'Level3.1  seed400',\
 'outS500.txt' using 3:6 with line lc rgb "green" title 'Level3.1  seed500',\
 'outS600.txt' using 3:6 with line lc rgb "dark-green" title 'Level3.1  seed600',\
 'outS700.txt' using 3:6 with line lc rgb "blue" title 'Level3.1  seed700',\
 'outS800.txt' using 3:6 with line lc rgb "cyan" title 'Level3.1  seed800',\
 'outS900.txt' using 3:6 with line lc rgb "magenta" title 'Level3.1  seed900',\
 'outS1000.txt' using 3:6 with line lc rgb "pink" title 'Level3.1  seed1000'
EOF
echo "$outputfile3 にグラフ作成完了!!!"
open $outputfile3

gnuplot <<EOF
set datafile separator " "
set title 'Level3.1 重みを更新する様子 全seed値 '
set xlabel 'Iterations'
set ylabel 'Errors'
set terminal pdf font "MigMix 2M,14"
set output '$outputfile4'
plot 'outS100.txt' every ::::50 using 3:6 with line lc rgb "black" title 'Level3.1 seed100',\
 'outS200.txt' every ::::50 using 3:6 with line lc rgb "gray" title 'Level3.1  seed200',\
 'outS300.txt' every ::::50 using 3:6 with line lc rgb "red" title 'Level3.1  seed300',\
 'outS400.txt' every ::::50 using 3:6 with line lc rgb "yellow" title 'Level3.1  seed400',\
 'outS500.txt' every ::::50 using 3:6 with line lc rgb "green" title 'Level3.1  seed500',\
 'outS600.txt' every ::::50 using 3:6 with line lc rgb "dark-green" title 'Level3.1  seed600',\
 'outS700.txt' every ::::50 using 3:6 with line lc rgb "blue" title 'Level3.1  seed700',\
 'outS800.txt' every ::::50 using 3:6 with line lc rgb "cyan" title 'Level3.1  seed800',\
 'outS900.txt' every ::::50 using 3:6 with line lc rgb "magenta" title 'Level3.1  seed900',\
 'outS1000.txt' every ::::50 using 3:6 with line lc rgb "pink" title 'Level3.1  seed1000'
EOF
echo "$outputfile4 にグラフ作成完了!!!"
open $outputfile4
