#!/usr/bin/env bash

cd ./web || exit
if ! ls *.php -l | wc -l || false; then
    echo "PHP Work!"
fi

cd ./python || exit
if ! ls *.py -l | wc -l || false; then
    echo "Python Work!"
fi

cd ./java || exit
if ! ls *.java -l | wc -l || false; then
    echo "Java Work!"
fi
