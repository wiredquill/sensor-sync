#!/usr/bin/env bash


# echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy 

apt-get update
apt-get upgrade
apt-get install sense-hat

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.17.0-rc.0/node_exporter-0.17.0-rc.0.linux-armv7.tar.gz > node_exporter.tar.gz && \
tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

mkdir -p /var/lib/node_exporter/textfile
chmod 777 /var/lib/node_exporter/textfile 

cp nodeexporter.service /etc/systemd/system

systemctl daemon-reload 
systemctl enable nodeexporter 
systemctl start nodeexporter


