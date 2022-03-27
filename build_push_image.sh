#!/bin/bash
set -e

VERSION="7.0.0"

docker build --tag itom34/geneweb:${VERSION} --tag itom34/geneweb:latest .

docker push itom34/geneweb:${VERSION}
docker push itom34/geneweb:latest
