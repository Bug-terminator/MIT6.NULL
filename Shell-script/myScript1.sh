#!/usr/bin/env bash

 n=$(( RANDOM % 100 ))
 if [[ n -eq 42 ]]; then
    echo "Something went wrong"
    >&2 echo "$n The error was using magic numbers"
    exit 1
 fi

 echo "$n Everything went according to plan"