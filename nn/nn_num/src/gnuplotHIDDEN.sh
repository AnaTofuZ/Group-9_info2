#!/bin/sh

set -eu

gnuplot<<EOF
set xlabel "iteration"
set ylabel "error"
set title "Eror transition per iteration on BP-NN at modified HIDDEN"
plot "result-seedHIDDEN1.data" with line
replot "result-seedHIDDEN5.data" with line
replot "result-seedHIDDEN15.data" with line
set terminal pdf
set output "HIDDEN.pdf"
replot
EOF
