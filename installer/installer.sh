#!/usr/bin/env bash

set -e

tar -xzvf *.tar.gz ./

sh ./installer/install.sh

cd ./src
docker-compose up -d
