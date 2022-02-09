#!/bin/bash
set -o errexit
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

get-asmcli(){
    curl https://storage.googleapis.com/csm-artifacts/asm/asmcli_1.12 > asmcli
    chmod +x asmcli
}

set-context(){
    echo "${bold}setting context...${normal}"
    aws eks update-kubeconfig \
      --name eks-apigee-dc1 \
      --region us-west-2
}

asm-validate(){
    set-context

    echo "${bold}installing anthos service mesh...${normal}"
    get-asmcli

    kubectl create ns istio-system 2>/dev/null \
    || echo "${bold}creating namespace istio-system...${normal}"

    kubectl create clusterrolebinding cluster-admin-binding \
      --clusterrole=cluster-admin \
      --user=greg.robinson@arctiq.ca 2>/dev/null \
    || echo "${bold}creating admin role-binding...${normal}"

    echo "${bold}validating asm...${normal}"
    ./asmcli validate \
      --kubeconfig ${KUBECONFIG} \
      --fleet_id greg-apigee-hybrid-eks \
      --output_dir . \
      --platform multicloud
}

asm-validate
