#!/bin/bash

cat <<EOT >> /etc/dnsmasq.d/local_server.conf
cname=portainer,moinho
cname=portainer.thisnode.info,moinho.thisnode.info
cname=grafana,moinho
cname=grafana.thisnode.info,moinho.thisnode.info
cname=pihole,moinho
cname=pihole.thisnode.info,moinho.thisnode.info
EOT
/etc/init.d/dnsmasq restart
