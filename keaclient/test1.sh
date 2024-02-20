#!/bin/bash


while true
do 
    # Check if DHCP4_SERVER is set and is a valid IP address
    if [[ -n "$DHCP4_SERVER" && $DHCP4_SERVER =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        # If DHCP4_SERVER is set and is a valid IP, run the perfdhcp command
        perfdhcp -xi -t 2 -r 5 -R 50 -n $DHCP4_SERVER
    else
        # If DHCP4_SERVER is not set or is not a valid IP, print an error message and just loop. purpose is to allow this to be jumped into with kubectl exec
        echo "Error: DHCP4_SERVER is not set or is not a valid IP address. Waiting 60 seconds "
        sleep 60;
    fi
    ## perfdhcp -xi -t 2 -r 5 -R 50 -n 254 196.240.0.40
    # while true; do echo sleep; sleep 60; done;
done