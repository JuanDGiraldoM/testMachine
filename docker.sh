# !/bin/sh
set -e

echo
echo "***********************************************************"
echo Test container tools
echo "***********************************************************"
docker image rm -f alpine:latest || true
docker container rm -f temp || true

echo
echo =============================================================
echo docker --version
echo =============================================================
time docker --version

echo
echo =============================================================
echo docker build -t temp Docker
echo =============================================================
time docker build -t temp Docker

echo
echo =============================================================
echo docker build -t temp Docker -- caché
echo =============================================================
time docker build -t temp Docker

echo
echo =============================================================
echo docker run --name temp temp ls
echo =============================================================
time docker run --name temp temp ls

echo
echo =============================================================
echo docker image ls
echo =============================================================
time docker image ls

echo
echo =============================================================
echo docker container ls -a
echo =============================================================
time docker container ls -a

echo
echo =============================================================
echo docker container rm temp
echo =============================================================
time docker container rm temp

echo
echo =============================================================
echo docker image rm temp
echo =============================================================
time docker image rm temp
