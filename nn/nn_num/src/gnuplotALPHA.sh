#!/bin/sh

set -eu

gnuplot<<EOF
set xlabel "iteration"
set ylabel "error"
set title "Eror transition per iteration on BP-NN at modified ALPHA"
plot "result-seedALPHA0.01.data" with line
replot "result-seedALPHA1.00.data" with line
replot "result-seedALPHA1.98.data" with line
set terminal pdf
set output "ALPHA.pdf"
replot
EOF
