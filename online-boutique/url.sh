#!/bin/bash
set -o errexit
set -o pipefail

export cyan=$(tput setaf 6)
export green=$(tput setaf 2)
export warn=$(tput setaf 3)
export red=$(tput setaf 1)
export bold=$(tput bold)
export normal=$(tput sgr0)

#tag="latest"
registry_prefix="docker.io/gregnrobinson"
target_dir="/Users/gregrobinson/repos/a-eks-anthos-demo/config-management/online-boutique"

pushd "$target_dir"
grep -n "image: " *.yaml | awk -F  ": " '{print $3}' > base_urls
cat base_urls | while read line
do  
    name=$(echo $line | cut -f4-4 -d"/" | cut -f1 -d":")
    tag="${tag:=$(echo $line | cut -f2 -d":")}"
    echo "${cyan}Importing $line as ${bold}$registry_prefix/$name/$tag${normal}"
    docker pull $line
    docker tag $line $registry_prefix/$name/$tag
    docker push $registry_prefix/$name/$tag
done
popd

