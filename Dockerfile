# A Dockerfile which gets a minimal nginx test environment set up, allowing
# Travis-CI to ask nginx if this config is valid.

FROM ubuntu:16.04

RUN apt-get -q update && \
    apt-get -y -q dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ca-certificates curl geoip-database-extra openssl && \
    ln -s GeoIPCity.dat /usr/share/GeoIP/GeoLiteCity.dat && \
    mkdir /etc/ssl-example && \
    printf "\n\n\n\n\nwww.example.com\n\n" | openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/ssl-example/wildcard.example.com.key -out /etc/ssl-example/wildcard.example.com.crt && \
    printf "\n\n\n\n\nwww.example.org\n\n" | openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/ssl-example/wildcard.example.org.key -out /etc/ssl-example/wildcard.example.org.crt && \
    echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list && \
    curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key add - && \
    apt-get -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends nginx nginx-module-geoip

ADD . /etc/nginx-test

RUN nginx -c /etc/nginx-test/nginx.conf -t
