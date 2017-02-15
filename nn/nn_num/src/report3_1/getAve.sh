#!/bin/sh

aveFile="./result/average.txt"
maxLine=0
numOfFile=0

echo "" > ${aveFile}

# 各ファイルの最大行数取得
for file in `find ./result -type f -a -name "*.txt"`; do
  thisLine=`cat $file | grep -c ''`
  if [ $maxLine -lt $thisLine ]; then
	maxLine=`cat $file | wc -l`
  fi
done

echo maxLine $maxLine 
echo `cat $file | grep -c ''`

# average用のファイルを最大行数と同じ行数で初期化
for i in `seq 1 ${maxLine}`;do
  if [ $i -eq 1 ]; then
	echo ${i} 0 > ${aveFile}
  else
	echo ${i} 0 >> ${aveFile}
  fi
done

# 全ファイルに最大行数分書き込み
for file in `find ./result -type f -a -name "*.txt"`; do
  thisLine=`cat $file | grep -c ''`
  thisLine=`expr $thisLine + 1`
  if [ $thisLine -lt $maxLine ]; then
	for i in `seq ${thisLine} ${maxLine}`;do
	  echo iteration = ${i} error = 0 >> ${file}
	done
  fi
done

echo aveFile `cat $aveFile | grep -c ''` 行

# averageファイルに値を足し合わせる
for file in `find ./result -type f -a -name "out*.txt"`; do
  numOfFile=`expr $numOfFile + 1`
  echo "${file}実行中..."
  python createAvefile.py $aveFile $file
done
python makeAve.py $aveFile $numOfFile
