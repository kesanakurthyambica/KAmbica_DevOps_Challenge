#!/bin/bash

set -e

ARCHIVE=$1

tar -xzf ${ARCHIVE}

DIR=$(find . -maxdepth 1 -type d -name "release_v*")

cd ${DIR}

sha256sum -c SHA256SUMS

docker load -i eoir-stack.tar

docker compose up -d
