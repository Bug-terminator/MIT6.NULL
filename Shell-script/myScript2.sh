#!/bin/bash
declare -i i=0
./myScript1.sh
i+=1
while (($? == 0)); do
    i+=1
    ./myScript1.sh
done
echo "$i times"
