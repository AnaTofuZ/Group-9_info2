#!/bin/sh


echo "累積分布を元にグラフ作成中..."
gnuplot <<EOF
set datafile separator ","
set title 'OR問題 10回'
set xlabel 'iteration'
set ylabel 'error'
set terminal png font "MigMix 2M,14"
set output './Graph.png'
set logscale x
EOF
for
gnuplot <<EOF
plot "cumuDist.txt" using 2:1 with linespoints pt 5 title 'OR問題'
EOF
echo "./Graph.pngにグラフ作成完了!!!"
open ./Graph.png

# ベクター形式で出力して
