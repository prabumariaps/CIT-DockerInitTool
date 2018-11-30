#!/usr/bin/env bash

cd ./web || exit
if ! ls *.php -l | wc -l; then
    echo "PHP Work!"
fi

cd ./python || exit
if ! ls *.python -l | wc -l; then
    echo "Python Work!"
fi

cd ./java || exit
if ! ls *.java -l | wc -l; then
    echo "Java Work!"
fi
