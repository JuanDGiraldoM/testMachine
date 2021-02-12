# !/bin/sh
set -e

echo
echo =============================================================
echo -e "\e[93m Git\e[0m"
echo =============================================================
git --version

echo
echo =============================================================
echo -e "\e[93m AWS CLI\e[0m"
echo -e "\e[33mit should be version 2!\e[0m"
echo =============================================================
aws --version

echo
echo =============================================================
echo -e "\e[93m Docker\e[0m"
echo =============================================================
docker -v
docker image ls >logs/docker-images.log

echo
echo =============================================================
echo -e "\e[93m Kubectl\e[0m"
echo =============================================================
kubectl version --client
aws eks update-kubeconfig --name eks-ecosistemas-de-riesgos-qa

echo
echo =============================================================
echo -e "\e[93m Java\e[0m"
echo -e "\e[33mit should be 11!\e[0m"
echo =============================================================
java --version

echo
echo =============================================================
echo -e "\e[93m Gradle\e[0m"
echo =============================================================
gradle -v

echo
echo =============================================================
echo -e "\e[93m npm\e[0m"
echo =============================================================
npm -v

echo
echo =============================================================
echo -e "\e[93m ng\e[0m"
echo =============================================================
ng version
