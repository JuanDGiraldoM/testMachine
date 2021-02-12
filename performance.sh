# !/bin/sh
set -e

echo
echo -e "\e[96mTest tools"
echo -e "\e[96m*************************************************************\e[0m"
./test.sh

echo
echo -e "\e[96mClone Repos"
echo -e "\e[96m*************************************************************\e[0m"
./repos.sh

echo
echo -e "\e[96mDocker"
echo -e "\e[96m*************************************************************\e[0m"
./docker.sh

echo
echo -e "\e[96mJava Compilation"
echo -e "\e[96m*************************************************************\e[0m"
./gradle.sh

echo
echo -e "\e[96mJavascript Compilation"
echo -e "\e[96m*************************************************************\e[0m"
./node.sh

echo
echo -e "\e[96mKubernetes"
echo -e "\e[96m*************************************************************\e[0m"
./kubernetes.sh
