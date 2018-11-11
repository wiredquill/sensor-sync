#!/usr/bin/env bash

echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy 

sudo apt-get update
sudo apr-get upgrade
sudo apt-get install sense-hat

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.17.0-rc.0/node_exporter-0.17.0-rc.0.linux-armv7.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

sudo mkdir -p /var/lib/node_exporter/textfile
sudo chmod 777 /var/lib/node_exporter/textfile 
