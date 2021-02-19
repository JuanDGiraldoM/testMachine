# !/bin/sh
set -e

echo
echo =============================================================
echo -e "\e[93m Test container tools\e[0m"
echo =============================================================
docker image rm -f alpine:latest || true
docker container rm -f temp || true
docker builder prune -a -f

echo
echo =============================================================
echo -e "\e[93m docker --version\e[0m"
echo =============================================================
docker --version >logs/docker.log
time docker --version

echo
echo =============================================================
echo -e "\e[93m docker build -t temp Docker\e[0m"
echo =============================================================
time docker build -t temp Docker

echo
echo =============================================================
echo -e "\e[93m docker build -t temp Docker - Cache\e[0m"
echo =============================================================
time docker build -t temp Docker

echo
echo =============================================================
echo -e "\e[93m docker run --name temp temp ls\e[0m"
echo =============================================================
time docker run --name temp temp ls >logs/docker-run.log

echo
echo =============================================================
echo -e "\e[93m docker image ls\e[0m"
echo =============================================================
time docker image ls >logs/docker-images.log

echo
echo =============================================================
echo -e "\e[93m docker container ls -a\e[0m"
echo =============================================================
time docker container ls -a >logs/docker-containers.log

echo
echo =============================================================
echo -e "\e[93m docker container rm temp\e[0m"
echo =============================================================
time docker container rm temp

echo
echo =============================================================
echo -e "\e[93m docker image rm temp\e[0m"
echo =============================================================
time docker image rm temp
