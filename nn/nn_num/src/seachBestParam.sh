#!/bin/sh

resultfile="./seachParamResult.txt"

cat $resultfile | \
awk '

  BEGIN{
	min=1000
	min_column=0
	nowParam="Initialized"
  }

  NR % "2" == "1"{
	nowParam=$0
  }

  $3 > min {
	next
  } 


  NR % "2" == "0" && min > $3{
	min=$3
	print nowParam
	print "Best iteration : " $3
  }' | tail -n 2


  
#Best Param
#eta 1.83 alpha 0.73 hidden 15
# iteration =   69 error = 0.0001034919
