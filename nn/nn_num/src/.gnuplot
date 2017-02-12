set xlabel "iteration"
set ylabel "error"
set title "Error transition per iteration on BP-NN"
set terminal svg
set output "result-seed1000.svg"
plot "result-seed1000.data" with line
