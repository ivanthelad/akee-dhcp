FROM alpine:latest


LABEL Description="kea-dhcp Docker image based on Alpine Linux."

ENV DHCP4_SERVER=true
ENV DHCP6_SERVER=false

RUN apk --no-cache add kea bash tzdata

COPY kea.sh /etc/kea/
COPY kea-dhcp4.conf /etc/kea/kea-dhcp4.conf 
COPY kea-dhcp6.conf /etc/kea/kea-dhcp6.conf 
EXPOSE 67 68

CMD ["/bin/bash", "/etc/kea/kea.sh"]