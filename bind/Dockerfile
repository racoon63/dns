FROM alpine

RUN apk add --no-cache bind bind-tools bind-dnssec-tools

COPY named.conf /etc/bind/named.conf
COPY db.example.com /var/bind/db.example.com
COPY db.178.168.192 /var/bind/db.178.168.192

RUN dnssec-keygen -f KSK -a NSEC3RSASHA1 -b 4096 -n ZONE -k /var/bind/ example.com
RUN dnssec-keygen -f KSK -a NSEC3RSASHA1 -b 4096 -n ZONE -K /var/bind/ example.com
RUN chown -R named:named /etc/bind
RUN chown -R named:named /var/bind

EXPOSE 53/udp

WORKDIR /var/bind

HEALTHCHECK --timeout=30s --start-period=5s --retries=1 CMD [ "named-checkzone", "example.com", "/var/bind/db.example.com" ]

ENTRYPOINT [ "/usr/sbin/named", "-u", "named", "-c", "/etc/bind/named.conf", "-g" ]