#!/usr/bin/env bash

set -e

tar -xzvf *.tar.gz ./

sh ./installer/install.sh

cd ./src
systemctl daemon-reload
systemctl restart docker
docker-compose up -d
