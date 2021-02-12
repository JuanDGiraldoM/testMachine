# !/bin/sh
set -e

function catchError() {
    echo -e "\e[31mIt has failed to $1!\e[0m"
}

echo
echo =============================================================
echo Git
echo =============================================================
git --version || catchError "open git"

echo
echo =============================================================
echo AWS CLI
echo -e "\e[33mit should be version 2!\e[0m"
echo =============================================================
aws --version || catchError "open aws cli"

echo
echo =============================================================
echo Docker
echo =============================================================
docker -v || catchError "open docker"

echo
echo =============================================================
echo Kubectl
echo =============================================================
kubectl version --client || catchError "open k8s"

echo
echo =============================================================
echo Java
echo -e "\e[33mit should be 11!\e[0m"
echo =============================================================
java --version || catchError "open java"

echo
echo =============================================================
echo Gradle
echo =============================================================
gradle -v || catchError "open gradle"

echo
echo =============================================================
echo npm
echo =============================================================
npm -v || catchError "open npm"

echo
echo =============================================================
echo ng
echo =============================================================
ng version || catchError "open ng"
