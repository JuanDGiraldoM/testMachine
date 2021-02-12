# !/bin/sh
set -e

echo
echo =============================================================
echo -e "\e[93m npm version\e[0m"
echo =============================================================
npm -v >logs/npm.log
time gradle -v >logs/gradle.log

echo
echo =============================================================
echo -e "\e[93m node version\e[0m"
echo =============================================================
node -v >logs/node.log
time node -v >logs/node.log

echo
echo =============================================================
echo -e "\e[93m ng version\e[0m"
echo =============================================================
ng version >logs/ng.log
time ng version >logs/ng.log

cd fflags_frontend
echo
echo =============================================================
echo -e "\e[93m npm i\e[0m"
echo =============================================================
time npm i

echo
echo =============================================================
echo -e "\e[93m npm i - Cache\e[0m"
echo =============================================================
time npm i

echo
echo =============================================================
echo -e "\e[93m ng build\e[0m"
echo =============================================================
time ng build

echo
echo =============================================================
echo -e "\e[93m ng test\e[0m"
echo =============================================================
time ng test --code-coverage --watch=false --progress=false
