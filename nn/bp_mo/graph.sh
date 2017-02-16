seed=1000
while [ $seed -le 10000 ]
# $seed <= 10000 の間くり返す
do
gnuplot <<EOF
    set terminal svg
    set output 'g-${seed}.svg'
    set xlabel 'iteration'
    set ylabel 'error'
    set datafile separator ","
    plot "sim-${seed}.txt" w lp
    exit
EOF
seed=$(($seed + 1000))
done
