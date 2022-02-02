# k8s-image-importer

This project scans all yaml files in a target directory and extracts all images from the files as a list. The script than pulls the image, tags it, and pushes it to a public or private registry using a registry prefix. This script assumes you are already authenticated to your container registry.

## Usage

Set the following variables. `target_dir` refers to the folder containing the Kubernetes manifests. `registry_prefix` refers to the public or private docker registry you want to import all images too.

Test the functionality by copying and importing a 1:1 copy from the online boutique application images into your own repository. The only requirement is making sure the script is pointed at the correct folder.

```bash
# Set the target registry prefix. This usually consists of the regsitry domain followed by your username...
export registry_prefix="docker.io/gregnrobinson"

# If set, all yaml files within the target diretory are scanned, and any images found are imported into your container registry...registry...
export target_dir="/Users/gregrobinson/repos/a-eks-anthos-demo/config-management/online-boutique"

# If set, the target manifest is downloaded and images are extracted and imported into your container registry...
export target_url="https://github.com/jetstack/cert-manager/releases/download/v1.7.0/cert-manager.yaml"

# Execute the import script...
./run.sh
```
