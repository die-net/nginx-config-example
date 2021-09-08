# nginx-config-example [![Build Status](https://github.com/die-net/nginx-config-example/actions/workflows/docker-build.yml/badge.svg)](https://github.com/die-net/nginx-config-example/actions/workflows/docker-build.yml)

This is a complex [NginX](http://nginx.org/en/) configuration example that incorporates much of what I have learned about running NginX for years at scale at several large sites I've been involved with.

The most interesting features are:

* A rich set of [includes](https://github.com/die-net/nginx-config-example/tree/main/include) to add functionality at the server block or location block level.
* The use of [maps](https://github.com/die-net/nginx-config-example/blob/main/global.d/map.conf) to do complex conditionals instead of trying to rely on the limited "if".
* The use of chained "geo" and "map" to do [conditional rate-limiting](https://github.com/die-net/nginx-config-example/blob/main/global.d/limit.conf).

There are other goodies sprinkled throughout.

It is meant to be used as the basis for your own NginX config. Copy and modify it, removing the parts that aren't relevant to you.
