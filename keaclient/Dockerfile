FROM ubuntu:latest


LABEL Description="Client container to allow testing of the dhcp server. Performs a perf test if the DHCP server is set."

ENV DHCP4_SERVER=true
ENV DHCP6_SERVER=false

##   RUN apt --no-cache add kea-admin bash tzdata
RUN apt-get update
RUN apt-get install kea-admin  nmap  isc-dhcp-client -y 
COPY  test1.sh test1.sh

##
CMD [ "./test1.sh" ]