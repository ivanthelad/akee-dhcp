## Build on mac 
docker buildx build   --platform linux/amd64,linux/arm64,linux/x86_64  -t $REGISTRY/kea-dhcp-admin:v1  . --push

## TEST 
This command will simulation 254 DHCP clients send DHCP discover to DHCP server obtain IP address, Every time (one second) will send 5 DHCP Discover to DHCP server.

` perfdhcp -xi -t 2 -r 5 -R 254 -n 254 196.240.0.55 -l enp5s0 `


## run debug 
` kubectl run ephemeral-demo --image=$REGISTRY/kea-dhcp-admin:v1 --restart=Never`
## create deploy. 
This is create a load test against the dhcp server. 
 *  set the variable DHCP4_SERVER to the pod ip of the dhcp server

`kubectl -f deploy.yaml`

## notes
perfdhcp -xi -t 2 -r 5 -R 90 -n 254 196.240.0.40