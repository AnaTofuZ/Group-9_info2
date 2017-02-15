#/usr/bin/env python
import sys

args = sys.argv

fr = open(args[1], 'r')
accumuLines = fr.readlines()
fr.close

fr2 = open(args[2],'r')
materiLines = fr2.readlines()
fr2.close

fw = open(args[1], 'w')

for (accumuLine, materiLine) in zip(accumuLines, materiLines):
    accumuData = accumuLine[:-1].split(" ")
    materiData = materiLine[:-1].split(" ")

    accumuData[1] = str(float(accumuData[1]) + float(materiData[5]))
    fw.write(accumuData[0]+' '+accumuData[1]+'\n')
fw.close
