#!/usr/bin/env bash
for ((i=0; i<$1; ++i)); do
    printf "0.%03d%03d\n" $(($RANDOM%1000)) $(($RANDOM%1000))
done
