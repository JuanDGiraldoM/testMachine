# !/bin/sh
set -e

./docker.sh
./repos.sh
./gradle.sh
./node.sh
./kubernetes.sh
