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

```bash
Importing gcr.io/google-samples/microservices-demo/emailservice:v0.3.5 as docker.io/gregnrobinson/emailservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/emailservice
Digest: sha256:40a85f4a8335edd7ed96757ecfd091ca0f223d14a2413aa9a849ddaa2c857196
Status: Image is up to date for gcr.io/google-samples/microservices-demo/emailservice:v0.3.5
gcr.io/google-samples/microservices-demo/emailservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/emailservice]
92cc347eb187: Layer already exists 
8b35d9bb7b15: Layer already exists 
1d80d35f2185: Layer already exists 
0c4a52d07651: Layer already exists 
c4f25a61c85e: Layer already exists 
25ad0307b4c1: Layer already exists 
874b45955cb1: Layer already exists 
85c923303735: Layer already exists 
d0fa20bfdce7: Layer already exists 
2edcec3590a4: Layer already exists 
v0.3.5: digest: sha256:40a85f4a8335edd7ed96757ecfd091ca0f223d14a2413aa9a849ddaa2c857196 size: 2421
Importing gcr.io/google-samples/microservices-demo/checkoutservice:v0.3.5 as docker.io/gregnrobinson/checkoutservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/checkoutservice
Digest: sha256:e4cbdcd58cc5b60364e64c205c95e94d0341ff96655ca0965b10d16095080c0e
Status: Image is up to date for gcr.io/google-samples/microservices-demo/checkoutservice:v0.3.5
gcr.io/google-samples/microservices-demo/checkoutservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/checkoutservice]
a701304aba18: Layer already exists 
60c94e9a3407: Layer already exists 
c228f8e1520e: Layer already exists 
397f5d8c141d: Layer already exists 
8d3ac3489996: Layer already exists 
v0.3.5: digest: sha256:e4cbdcd58cc5b60364e64c205c95e94d0341ff96655ca0965b10d16095080c0e size: 1367
Importing gcr.io/google-samples/microservices-demo/recommendationservice:v0.3.5 as docker.io/gregnrobinson/recommendationservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/recommendationservice
Digest: sha256:558d5dfe8f81daf862a20c863501787dd2c062b75dd72fef5d1a9bdf85b52128
Status: Image is up to date for gcr.io/google-samples/microservices-demo/recommendationservice:v0.3.5
gcr.io/google-samples/microservices-demo/recommendationservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/recommendationservice]
284f8cf9e4f2: Layer already exists 
9a3149864544: Layer already exists 
cdafc426e9f8: Layer already exists 
887613a2669d: Layer already exists 
4f20b1851f43: Layer already exists 
28528648379f: Layer already exists 
25ad0307b4c1: Layer already exists 
874b45955cb1: Layer already exists 
85c923303735: Layer already exists 
d0fa20bfdce7: Layer already exists 
2edcec3590a4: Layer already exists 
v0.3.5: digest: sha256:558d5dfe8f81daf862a20c863501787dd2c062b75dd72fef5d1a9bdf85b52128 size: 2628
Importing gcr.io/google-samples/microservices-demo/frontend:v0.3.5 as docker.io/gregnrobinson/frontend:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/frontend
Digest: sha256:8a3d0dc6e0cffc25845d1f659600e7f751fd46b08f2dd48cd938d4076e767985
Status: Image is up to date for gcr.io/google-samples/microservices-demo/frontend:v0.3.5
gcr.io/google-samples/microservices-demo/frontend:v0.3.5
The push refers to repository [docker.io/gregnrobinson/frontend]
91d41a035f85: Layer already exists 
7486ec0ace82: Layer already exists 
2be0a5b146d0: Layer already exists 
ef69297e0943: Layer already exists 
021af0f482c2: Layer already exists 
8d3ac3489996: Layer already exists 
v0.3.5: digest: sha256:8a3d0dc6e0cffc25845d1f659600e7f751fd46b08f2dd48cd938d4076e767985 size: 1576
Importing gcr.io/google-samples/microservices-demo/paymentservice:v0.3.5 as docker.io/gregnrobinson/paymentservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/paymentservice
Digest: sha256:fa00acd2487c2d7bf44c424ce38b3610c42002c0b2db1618c7e10185a85ba09b
Status: Image is up to date for gcr.io/google-samples/microservices-demo/paymentservice:v0.3.5
gcr.io/google-samples/microservices-demo/paymentservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/paymentservice]
9c85530af6e0: Layer already exists 
89a2bcf257d1: Layer already exists 
a529d6641d6b: Layer already exists 
9593cdad322c: Layer already exists 
ff64ee97d76a: Layer already exists 
480f61641fa1: Layer already exists 
b3eaed7a085d: Layer already exists 
1a058d5342cc: Layer already exists 
v0.3.5: digest: sha256:fa00acd2487c2d7bf44c424ce38b3610c42002c0b2db1618c7e10185a85ba09b size: 1996
Importing gcr.io/google-samples/microservices-demo/productcatalogservice:v0.3.5 as docker.io/gregnrobinson/productcatalogservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/productcatalogservice
Digest: sha256:87649e3298a1f2c243df96ff66b3368384a31b94cafe3d08c4a0e4efe8f562cc
Status: Image is up to date for gcr.io/google-samples/microservices-demo/productcatalogservice:v0.3.5
gcr.io/google-samples/microservices-demo/productcatalogservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/productcatalogservice]
e1981113a0d2: Layer already exists 
3f0055aa27a3: Layer already exists 
60c94e9a3407: Layer already exists 
c228f8e1520e: Layer already exists 
397f5d8c141d: Layer already exists 
8d3ac3489996: Layer already exists 
v0.3.5: digest: sha256:87649e3298a1f2c243df96ff66b3368384a31b94cafe3d08c4a0e4efe8f562cc size: 1574
Importing gcr.io/google-samples/microservices-demo/cartservice:v0.3.5 as docker.io/gregnrobinson/cartservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/cartservice
Digest: sha256:bc8d6d00a8191b2cd729a62d86c85ade30642c513c32db1cd13c9e75d7a649ff
Status: Image is up to date for gcr.io/google-samples/microservices-demo/cartservice:v0.3.5
gcr.io/google-samples/microservices-demo/cartservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/cartservice]
ce91603111b4: Layer already exists 
703f81000823: Layer already exists 
eebc3eafd7cc: Layer already exists 
98bc857b3aed: Layer already exists 
1a058d5342cc: Layer already exists 
v0.3.5: digest: sha256:bc8d6d00a8191b2cd729a62d86c85ade30642c513c32db1cd13c9e75d7a649ff size: 1369
Importing busybox:latest as docker.io/gregnrobinson/busybox:latest
latest: Pulling from library/busybox
Digest: sha256:5acba83a746c7608ed544dc1533b87c737a0b0fb730301639a0179f9344b1678
Status: Image is up to date for busybox:latest
docker.io/library/busybox:latest
The push refers to repository [docker.io/gregnrobinson/busybox]
468ad4d964cd: Layer already exists 
latest: digest: sha256:a77fe109c026308f149d36484d795b42efe0fd29b332be9071f63e1634c36ac9 size: 527
Importing gcr.io/google-samples/microservices-demo/loadgenerator:v0.3.5 as docker.io/gregnrobinson/loadgenerator:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/loadgenerator
Digest: sha256:64d4f1898eddee73ffccada67ed425e5256c74c783a2bac23fdd9239943c7857
Status: Image is up to date for gcr.io/google-samples/microservices-demo/loadgenerator:v0.3.5
gcr.io/google-samples/microservices-demo/loadgenerator:v0.3.5
The push refers to repository [docker.io/gregnrobinson/loadgenerator]
250e7eb5d876: Layer already exists 
baca994a0d40: Layer already exists 
c51397128200: Layer already exists 
e6203d5e9930: Layer already exists 
036c62fedfcf: Layer already exists 
01d721979fd7: Layer already exists 
d0fa20bfdce7: Layer already exists 
2edcec3590a4: Layer already exists 
v0.3.5: digest: sha256:64d4f1898eddee73ffccada67ed425e5256c74c783a2bac23fdd9239943c7857 size: 1997
Importing gcr.io/google-samples/microservices-demo/currencyservice:v0.3.5 as docker.io/gregnrobinson/currencyservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/currencyservice
Digest: sha256:4200ce1e320c7d811850de823967986a9ad84f79e276b97cd48cbdcb39bed20f
Status: Image is up to date for gcr.io/google-samples/microservices-demo/currencyservice:v0.3.5
gcr.io/google-samples/microservices-demo/currencyservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/currencyservice]
80502334e6ce: Layer already exists 
921984455089: Layer already exists 
a529d6641d6b: Layer already exists 
9593cdad322c: Layer already exists 
ff64ee97d76a: Layer already exists 
480f61641fa1: Layer already exists 
b3eaed7a085d: Layer already exists 
1a058d5342cc: Layer already exists 
v0.3.5: digest: sha256:4200ce1e320c7d811850de823967986a9ad84f79e276b97cd48cbdcb39bed20f size: 1996
Importing gcr.io/google-samples/microservices-demo/shippingservice:v0.3.5 as docker.io/gregnrobinson/shippingservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/shippingservice
Digest: sha256:d242bc7c1b3922bb5f4fc6c170ae45650499def444ec28bfafdc8f3310cd4fa7
Status: Image is up to date for gcr.io/google-samples/microservices-demo/shippingservice:v0.3.5
gcr.io/google-samples/microservices-demo/shippingservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/shippingservice]
7d9821f90012: Layer already exists 
60c94e9a3407: Layer already exists 
c228f8e1520e: Layer already exists 
397f5d8c141d: Layer already exists 
8d3ac3489996: Layer already exists 
v0.3.5: digest: sha256:d242bc7c1b3922bb5f4fc6c170ae45650499def444ec28bfafdc8f3310cd4fa7 size: 1367
Importing redis:alpine as docker.io/gregnrobinson/redis:alpine
alpine: Pulling from library/redis
Digest: sha256:4bed291aa5efb9f0d77b76ff7d4ab71eee410962965d052552db1fb80576431d
Status: Image is up to date for redis:alpine
docker.io/library/redis:alpine
The push refers to repository [docker.io/gregnrobinson/redis]
0d897cdd403d: Layer already exists 
9cb07bc11122: Layer already exists 
d4cd359846d7: Layer already exists 
601431c21c2f: Layer already exists 
433b83039a5b: Layer already exists 
07d3c46c9599: Layer already exists 
alpine: digest: sha256:6d8f06cfacafc0c6eff32b2f49a137cf6f358e8878944f68edce50269f5f215f size: 1571
Importing gcr.io/google-samples/microservices-demo/adservice:v0.3.5 as docker.io/gregnrobinson/adservice:v0.3.5
v0.3.5: Pulling from google-samples/microservices-demo/adservice
Digest: sha256:e2a6a1d6815aca3b04cd818d5342ea2520266926c539db26f1542cb43d1e25bc
Status: Image is up to date for gcr.io/google-samples/microservices-demo/adservice:v0.3.5
gcr.io/google-samples/microservices-demo/adservice:v0.3.5
The push refers to repository [docker.io/gregnrobinson/adservice]
d708e42e6d16: Layer already exists 
c72baab9a3ed: Layer already exists 
072b1570446f: Layer already exists 
d349776cb57d: Layer already exists 
27a56aebb4df: Layer already exists 
8138b5fec066: Layer already exists 
f3fd6088fa34: Layer already exists 
2bf2b8c78141: Layer already exists 
e8b689711f21: Layer already exists 
v0.3.5: digest: sha256:e2a6a1d6815aca3b04cd818d5342ea2520266926c539db26f1542cb43d1e25bc size: 2211
~/k8s-image-importer
```
