#!/bin/sh
#seed値を10回変えて実行，seed値ごとのグラフを作成するためのデータ集め

seed=1000
while [ $seed -le 10000 ]
# $seed <= 10000 の間くり返す
do
    rm res-${seed}.txt
    rm sim-${seed}.txt
    rm err-${seed}.txt
    ./bp_mo ${seed} | cut -c14-17,27- >> res-${seed}.txt
    #実行結果iteration,error の値のみ抜き出し
    ite=$(cat res-${seed}.txt | cut -c1-2 | tail -1 )
    #総学習回数を保存
    cat res-${seed}.txt | tail -r | tail +6 | tail -r >> sim-${seed}.txt
    #実行結果の下から5行以外を抜き出し
        cat sim-${seed}.txt |  while read line
        #実行結果を1行ずつ読み込み
        do
        cut -c5- >> err-${seed}.txt
        #errorのみ抜き出し
        done
    seed=$(($seed + 1000))
done
