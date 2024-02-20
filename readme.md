# 
Purpose of this repo is to demo hosting a DHCP server runing on kubernetes. It contains two images that need to be built
 * the image in this root folder containers the kea dhcp server. 
 * image under keadclient contains a simple container with kea-admin utils to test 
An example purpose of the dhcp server is to list on a secondary NIC in a AKS EE cluster and provide ip addresses to iot devices. The secondary nic would be setup using multus
*  https://github.com/k8snetworkplumbingwg/multus-cni/blob/master/docs/quickstart.md


 ## Config and build
 when running in a k8s cluster and to test you need to set the subnet field in the file kea-dhcp4.conf to a range that corrosponds to the client making the request. for simply case, simply set this to a the pod ip range (or subnet range) 


## Build 
```
docker buildx build   --platform linux/amd64,linux/arm64,linux/x86_64  -t $REGISTRY/kea-dhcp:v1  . --push
```


## How to configure 
https://kea.readthedocs.io/en/kea-2.4.0/arm/dhcp4-srv.html#dhcpv4-server-configuration 


## Create deployment in aks 
````
kubectl create 
kubectl deploy -f deploy 
```

## Configure the dhcp server 
    "subnet4": [
        {
            "subnet": "192.168.1.0/24",
            "pools": [
                {
                     "pool": "192.168.1.50 - 192.168.1.200"
                }
            ]
        }
    ]