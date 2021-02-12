# !/bin/sh
set -e

echo
echo =============================================================
echo npm version
echo =============================================================
npm -v >npm.log
time gradle -v >gradle.log

echo
echo =============================================================
echo node version
echo =============================================================
node -v >node.log
time node -v >node.log

echo
echo =============================================================
echo ng version
echo =============================================================
ng version >ng.log
time ng version >ng.log

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