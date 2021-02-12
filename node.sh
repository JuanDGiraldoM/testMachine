# !/bin/sh
set -e

echo
echo =============================================================
echo npm version
echo =============================================================
npm -v >logs/npm.log
time gradle -v >logs/gradle.log

echo
echo =============================================================
echo node version
echo =============================================================
node -v >logs/node.log
time node -v >logs/node.log

echo
echo =============================================================
echo ng version
echo =============================================================
ng version >logs/ng.log
time ng version >logs/ng.log

echo
echo =============================================================
echo npm i
echo =============================================================
cd fflags_frontend
time npm i

echo
echo =============================================================
echo ng build
echo =============================================================
time ng build

echo
echo =============================================================
echo ng test
echo =============================================================
time ng test --code-coverage --watch=false --progress
