# !/bin/sh
set -e

function cleanWorkspace() {
    rm -rf NU0027001_RIA_MR || catchError "clean repo"
    rm -rf ms_balances_api || catchError "clean repo"
    rm -rf NU0025001_fflags_frontend || catchError "clean repo"
    rm -rf fflags_frontend || catchError "clean repo"
}

function catchError() {
    echo -e "\e[31mIt has failed to $1!\e[0m"
}

git config --system core.longpaths true || catchError "configure git long paths - execute as admin"

echo
echo =============================================================
echo Clean workspace
echo =============================================================
cleanWorkspace

echo
echo =============================================================
echo Clone repository ms_balances_api
echo =============================================================
git clone https://GrupoBancolombia@dev.azure.com/GrupoBancolombia/Vicepresidencia%20Servicios%20de%20Tecnolog%C3%ADa/_git/NU0027001_RIA_MR || rm -rf NU0027001_RIA_MR
mv NU0027001_RIA_MR/ms_balances_api .
rm -rf NU0027001_RIA_MR

echo
echo =============================================================
echo Clone repository fflags_frontend
echo =============================================================
git clone https://GrupoBancolombia@dev.azure.com/GrupoBancolombia/Vicepresidencia%20Servicios%20de%20Tecnolog%C3%ADa/_git/NU0025001_fflags_frontend || rm -rf NU0025001_fflags_frontend
mv NU0025001_fflags_frontend fflags_frontend
