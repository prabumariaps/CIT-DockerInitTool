#!/usr/bin/env bash

# cd ./web || true
if [ "$(ls ./web/*.php -l | wc -l)" -gt 0 ]; then
    echo "PHP Work!"
fi

# cd ./python || true
if [ "$(ls ./python/*.py -l | wc -l)" -gt 0 ]; then
    echo "Python Work!"
fi

# cd ./java || true
if [ "$(ls ./java/*.war -l | wc -l)" -gt 0 ]; then
    echo "Java Work!"
fi
