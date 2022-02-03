# k8s-image-importer

- [Usage](#usage)
- [Examples](#examples)

This project scans all yaml files in a target directory and extracts all images from the files as a list. The script than pulls the image, tags it, and pushes it to a public or private registry using a registry prefix. This script assumes you are already authenticated to your container registry.

## Usage

Set the following variables. `target_dir` refers to the folder containing the Kubernetes manifests. `registry_prefix` refers to the public or private docker registry you want to import all images too.

Test the functionality by copying and importing a 1:1 copy from the online boutique application images into your own repository. The only requirement is making sure the script is pointed at the correct folder.

```bash
Usage: ./k8s-image-importer -u targetUrl -d targetDir -r registryPrefix

-d Import all container images within a directory.  
-u Import all container images using an http/https address. 
-r The container registry where the images will be sent.
```

## Examples

```sh
# Import images from a manifest URL...
./k8s-image-importer \
    -u https://github.com/jetstack/cert-manager/releases/download/v1.7.0/cert-manager.yaml \
    -r docker.io/gregnrobinson

# Import container images from all yaml files within a directory...
./k8s-image-importer \
    -d ./online-boutique \
    -r docker.io/gregnrobinson

# Import container images from a directory and url...
./k8s-image-importer \
    -d ./online-boutique \
    -u https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml \
    -r docker.io/gregnrobinson
```

[![asciicast](https://asciinema.org/a/466220.svg)](https://asciinema.org/a/466220)
