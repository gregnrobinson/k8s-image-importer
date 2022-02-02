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

function target-url(){
if [[ ! -z $target_url ]]
then
  wget -q $target_url -O manifest.yaml &&\
  grep -n "image: " manifest.yaml | awk -F  ": " '{print $3}' | sed -e 's/^"//' -e 's/"$//' > target_url
  cat target_url | while read line
  do
      name=$(echo $line | cut -f3-4 -d"/")
      
      echo "${normal}${cyan}Importing $line as ${bold}$registry_prefix/$name${normal}${bold}"
      docker pull $line
      docker tag $line $registry_prefix/$name
      docker push $registry_prefix/$name
  done
fi
}

function target-dir(){
if [[ ! -z $target_dir ]]
then
  pushd "$target_dir"
  grep -n "image: " *.yaml | awk -F  ": " '{print $3}' | sed -e 's/^"//' -e 's/"$//' > target_dir

  cat target_dir | while read line
  do  
      name=$(echo $line | cut -f4-4 -d"/")
      echo "${normal}${cyan}Importing $line as ${bold}$registry_prefix/$name${normal}${bold}"
      docker pull $line
      docker tag $line $registry_prefix/$name
      docker push $registry_prefix/$name
  done
  popd
fi
}

function display_help() {
    SHORT_SHA="$(git rev-parse --short HEAD)"
    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    echo ""
    echo "${cyan}k8s image importer${normal}"
    echo ""
    echo "Usage: run.sh [option...]" >&2
    echo
    echo "   ${bold}-d, --target-dir${normal}    Pull all images from all ${bold}yaml${normal} files within a directory. "
    echo "   ${bold}-u, --target-url${normal}    Pull all images from a ${bold}yaml${normal} file using http/https. "
    echo "   ${bold}-h, --help${normal}          Display argument options. "
    echo
    exit 1
}

while :
do
    case "$1" in
      -h | --help)
          display_help
          exit 0
          ;;
      -d | --target-dir)
          prune
          shift 2
          ;;
      -u | --target-url)
          delete
          shift 2
          ;;

      --) # End of all options
          shift
          break
          ;;
      -*)
          echo "Error: Unknown option: $1" >&2
          ## or call function display_help
          exit 1
          ;;
      *)  # No more options
          break
          ;;
    esac
done

case "$1" in
  *)
     display_help

     exit 1
     ;;
esac
