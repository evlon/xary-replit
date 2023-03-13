#!/bin/bash
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

cat ./python/config.json | sed "s/uuid/$(uuidgen)/" > /tmp/config.json

./caddy start --config ./python/Caddyfile
./web -c /tmp/config.json >/dev/null 2>&1 &
#tail -f