# k8s-image-importer
This project scans all yaml files in a target directory and extracts all images from the files as a list. The script than pulls the image, tags it, and pushes it to a public or private registry using a registry prefix. This script assumes you are already authenticated to your container registry.

## Usage

Set the following variables. `target_dir` refers to the folder containing the Kubernetes manifests. `registry_prefix` refers to the public or private docker registry you want to import all images too.

Test the functionality by copying and importing a 1:1 copy from the online boutique application images into your own repository. The only requirement is making sure the script is pointed at the correct folder.

```bash
export registry_prefix="docker.io/gregnrobinson"
export target_dir="./online-boutique"

./run.sh
```
