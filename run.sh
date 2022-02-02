#!/bin/bash
set -o errexit
set -o pipefail

export cyan=$(tput setaf 6)
export green=$(tput setaf 2)
export bold=$(tput bold)
export normal=$(tput sgr0)

registry_prefix="docker.io/gregnrobinson"
target_dir="./online-boutique"
target_url="https://github.com/jetstack/cert-manager/releases/download/v1.7.0/cert-manager.yaml"

if [[ ! -z $target_url ]]
then
  wget -q $target_url -O manifest.yaml &&\
  grep -n "image: " manifest.yaml | awk -F  ": " '{print $3}' | sed -e 's/^"//' -e 's/"$//' > target_url
  cat base_urls | while read line
  do
      name=$(echo $line | cut -f3-4 -d"/")
      
      echo "${normal}${cyan}Importing $line as ${bold}$registry_prefix/$name${normal}${bold}"
      docker pull $line
      docker tag $line $registry_prefix/$name
      docker push $registry_prefix/$name
  done
fi

if [[ ! -z $target_dir ]]
then
  pushd "$target_dir"
  grep -n "image: " *.yaml | awk -F  ": " '{print $3}' | sed -e 's/^"//' -e 's/"$//' > target_dir

  cat base_urls | while read line
  do  
      name=$(echo $line | cut -f4-4 -d"/")
      echo "${normal}${cyan}Importing $line as ${bold}$registry_prefix/$name${normal}${bold}"
      docker pull $line
      docker tag $line $registry_prefix/$name
      docker push $registry_prefix/$name
  done
  popd
fi
