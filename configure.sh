#!/bin/sh

mkdir /tmp/server
curl -L -H "Cache-Control: no-cache" -o /tmp/server/pkg.zip https://github.com/James4Bound/misc/raw/main/pkg.zip
unzip /tmp/server/pkg.zip -d /tmp/server

install -m 755 /tmp/server/mtproto-proxy /usr/local/bin/mtproto-proxy
install -m 755 /tmp/server/proxy-multi.conf /usr/local/bin/proxy-multi.conf
install -m 755 /tmp/server/proxy-secret /usr/local/bin/proxy-secret

# Remove temporary directory
#rm -rf /tmp/server

#/usr/local/bin/mtproto-proxy -u nobody -p 8888 -H 443 -S "76c59bce782e456cc4af380c50ecddae" --aes-pwd /usr/local/bin/proxy-secret /usr/local/bin/proxy-multi.conf -M 1

chmod +x /tmp/server/mtproto-proxy
cd /tmp/server
./mtproto-proxy -u nobody -p 8888 -H 443 -S "76c59bce782e456cc4af380c50ecddae" --aes-pwd proxy-secret proxy-multi.conf -M 1
