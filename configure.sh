#!/bin/sh

mkdir /tmp/server
curl -L -H "Cache-Control: no-cache" -o /tmp/server/pkg.bmp https://github.com/James4Bound/misc/raw/main/pkg.bmp
#unzip /tmp/server/pkg.zip -d /tmp/server
cd /tmp/server
tar xf /tmp/server/pkg.bmp
install -m 755 /tmp/server/mtproto-proxy /usr/local/bin/mtproto-proxy
install -m 755 /tmp/server/proxy-multi.conf /usr/local/bin/proxy-multi.conf
install -m 755 /tmp/server/proxy-secret /usr/local/bin/proxy-secret
cd /
# Remove temporary directory
rm -rf /tmp/server

/usr/local/bin/mtproto-proxy -u nobody -p 8888 -H 443 -S "76c59bce782e456cc4af380c50ecddae" --aes-pwd /usr/local/bin/proxy-secret /usr/local/bin/proxy-multi.conf -M 1
