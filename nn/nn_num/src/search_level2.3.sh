#!/bin/sh
set -eu

rm -f data.level3.3/*result.txt

for file in data.level3.3/eval*-*.txt; do
    echo "${file}"

./nn_num 1000 <<EOF >>.tmp
l
l
l
c
e
${file}
q
EOF
cat .tmp| tail -13|sed '$d' >${file}result.txt
rm -f .tmp
done
