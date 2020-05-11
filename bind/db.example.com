$TTL    604800
@       IN      SOA     ns.example.com. root.example.com. (
                    2020051101         ; Serial
                        604800         ; Refresh
                         86400         ; Retry
                       2419200         ; Expire
                        604800         ; Negative Cache TTL
)

; NS - RECORDS
@       IN      NS      ns.example.com.


; A - RECORDS
ns      IN      A       192.168.1.10
server  IN      A       192.168.1.21

; CNAME - RECORDS
host1   IN      CNAME   server.example.com.
