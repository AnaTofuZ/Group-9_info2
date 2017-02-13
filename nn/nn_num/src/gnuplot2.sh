#!/bin/sh

set -eu
TARGET=$1

gnuplot<<EOF
set xlabel "iteration"
set ylabel "error"
set title "Eror transition per iteration on BP-NN at modified ETA"
plot "result-seedETA0.01.data" with line
replot "result-seedETA1.00.data" with line
replot "result-seedETA1.98.data" with line
set terminal pdf
set output "${TARGET}.pdf"
replot
EOF
