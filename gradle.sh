# !/bin/sh
set -e

echo
echo =============================================================
echo Gradle version
echo =============================================================
gradle -v >gradle.log
time gradle -v >gradle.log
cd ms_balances_api

echo
echo =============================================================
echo Build project
echo =============================================================
time gradle build

echo
echo =============================================================
echo Build project - Cache
echo =============================================================
time gradle build
