#!/bin/bash

set -e

VERSION=1.4.2
RELEASE=release_v${VERSION}

rm -rf ${RELEASE}
mkdir -p ${RELEASE}

docker save registry.site.local/eoir-stack:${VERSION} \
  -o ${RELEASE}/eoir-stack.tar

cp docker-compose.yml ${RELEASE}/
cp .env.example ${RELEASE}/
cp -r models ${RELEASE}/

cd ${RELEASE}

find . -type f \
  -exec sha256sum {} \; > SHA256SUMS

cd ..

tar -czf ${RELEASE}.tar.gz ${RELEASE}
