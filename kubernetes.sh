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
echo Kubectl version
echo =============================================================
kubectl version --client >logs/kubectl.log
time kubectl version --client >logs/kubectl.log

echo
echo =============================================================
echo AWS Configure
echo =============================================================
aws configure set region us-east-1

echo
echo =============================================================
echo AWS update kubeconfig
echo =============================================================
aws eks update-kubeconfig --name eks-ecosistemas-de-riesgos-qa

echo
echo =============================================================
echo kubectl get pods
echo =============================================================
time kubectl -n ria-qa get pods >logs/pods.log
getPodName

echo
echo =============================================================
echo kubectl describe pod
echo =============================================================
time kubectl -n ria-qa describe pod $pod >logs/pods-describe.log

echo
echo =============================================================
echo kubectl logs
echo =============================================================
time kubectl -n ria-qa logs $pod -c $container >logs/pods-logs.log

echo
echo =============================================================
echo kubectl top pods
echo =============================================================
time kubectl -n ria-qa top pods >logs/pods-top.log
