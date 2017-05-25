# Include me in server blocks where the domain is *.example.com and we want
# to answer both http and https requests.

listen 80;
listen [::]:80;
listen 443 ssl;
listen [::]:443 ssl;

# This is the default certificate in global.d/default_server.conf.  Save
# memory by not defining it again unnecessarily:
#ssl_certificate     /etc/ssl-example/wildcard.example.com.crt;
#ssl_certificate_key /etc/ssl-example/wildcard.example.com.key;

userid_domain example.com;

root /etc/nginx/root/example.com;

include include/server-base;
