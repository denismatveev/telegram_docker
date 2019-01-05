#!/bin/bash
curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s  https://core.telegram.org/getProxyConfig -o proxy-multi.conf
mtproto-proxy -u nobody -p 8888 -H 4443 -S 711267a2914529533219eabafccb09dc --aes-pwd proxy-secret proxy-multi.conf -M 1
exec "$@"
