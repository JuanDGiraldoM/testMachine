# !/bin/sh
set -e

echo
echo =============================================================
echo -e "\e[93m Gradle version\e[0m"
echo =============================================================
gradle -v >logs/gradle.log
time gradle -v >logs/gradle.log

cd ms_balances_api
echo
echo =============================================================
echo -e "\e[93m Build project\e[0m"
echo =============================================================
time gradle build

echo
echo =============================================================
echo -e "\e[93m Build project - Cache\e[0m"
echo =============================================================
time gradle build

echo
echo =============================================================
echo -e "\e[93m Test project\e[0m"
echo =============================================================
time gradle test
