# !/bin/sh
set -e

function getPodName() {
    line=$(sed '10q;d' logs/pods.log)
    readarray -d - -t array <<<"$line"
    readarray -d '          ' -t tag <<<"${array[4]}"
    pod="${array[0]}-${array[1]}-${array[2]}-${array[3]}-$tag"
    container="${array[0]}-${array[1]}-container"
    echo $pod
    echo $container
}

echo
echo =============================================================
echo -e "\e[93m Kubectl version\e[0m"
echo =============================================================
kubectl version --client >logs/kubectl.log
time kubectl version --client >logs/kubectl.log

echo
echo =============================================================
echo -e "\e[93m AWS update kubeconfig\e[0m"
echo =============================================================
aws eks update-kubeconfig --name eks-ecosistemas-de-riesgos-qa

echo
echo =============================================================
echo -e "\e[93m kubectl get pods\e[0m"
echo =============================================================
time kubectl -n ria-qa get pods >logs/pods.log
getPodName

echo
echo =============================================================
echo -e "\e[93m kubectl describe pod\e[0m"
echo =============================================================
time kubectl -n ria-qa describe pod $pod >logs/pods-describe.log

echo
echo =============================================================
echo -e "\e[93m kubectl logs\e[0m"
echo =============================================================
time kubectl -n ria-qa logs $pod -c $container >logs/pods-logs.log

echo
echo =============================================================
echo -e "\e[93m kubectl top pods\e[0m"
echo =============================================================
time kubectl -n ria-qa top pods >logs/pods-top.log
