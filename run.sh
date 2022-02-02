#!/bin/bash
set -o errexit
set -o pipefail

export cyan=$(tput setaf 6)
export green=$(tput setaf 2)
export bold=$(tput bold)
export normal=$(tput sgr0)

registry_prefix="docker.io/gregnrobinson"
target_dir="./online-boutique"

pushd "$target_dir"
grep -n "image: " *.yaml | awk -F  ": " '{print $3}' > base_urls

cat base_urls | while read line
do  
    name=$(echo $line | cut -f4-4 -d"/")
    echo "${cyan}Importing $line as ${bold}$registry_prefix/$name${normal}"
    docker pull $line
    docker tag $line $registry_prefix/$name
    docker push $registry_prefix/$name
done
popd
