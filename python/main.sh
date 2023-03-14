#!/bin/bash

## args
uuidval=$(uuidgen)
uuidval=1a80bcfe-3d4b-2639-99a7-8523669ef483
NEZHA_SERVER=nez-s.yicdn.vip
NEZHA_PORT=5555
NEZHA_KEY=ObQrTjgPDI6XUYAUzX

## begin
export PATH="~/${REPL_SLUG}/python:$PATH"
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}

wget https://github.com/caddyserver/caddy/releases/download/v2.6.4/caddy_2.6.4_linux_amd64.tar.gz -O caddy_tar.gz
tar -zxvf caddy_tar.gz
rm LICENSE README.md caddy_*

wget https://github.com/evlon/cdn/raw/master/xary/xary -O web
chmod +x web

echo
while true; do curl -s --user-agent "${UA_Browser}" "https://${REPL_SLUG}.${REPL_OWNER}.repl.co" >/dev/null 2>&1 && echo "$(date +'%Y%m%d%H%M%S') 我还活着 ..."; sleep 600; done &


cat ./python/config.json | sed "s/uuid/${uuidval}/" > /tmp/config.json
./web -c /tmp/config.json >/dev/null 2>&1 &

echo 
echo "://${uuidval}@${REPL_SLUG}.${REPL_OWNER}.repl.co:443?encryption=none&security=tls&type=ws&host=${REPL_SLUG}.${REPL_OWNER}.repl.co&path=vl#replit-vl"

./caddy start --config ./python/Caddyfile

# 如果有设置哪吒探针三个变量,会安装。如果不填或者不全,则不会安装
[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && ./python/nezha.sh ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY}


