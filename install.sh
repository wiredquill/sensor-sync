#!/usr/bin/env bash


# echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy 

sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install sense-hat

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

sudo mkdir -p /var/lib/node_exporter/textfile
chmod 777 /var/lib/node_exporter/textfile 

sudo cp nodeexporter.service /etc/systemd/system
sudo cp nodeexporter-sensor.service /etc/systemd/system

sudo cp sensor-prometheus-export.sh /usr/local/bin
sudo chmod +x /usr/local/bin/sensor-prometheus-export.sh

sudo systemctl daemon-reload 
sudo systemctl enable --now nodeexporter 
sudo systemctl enable --now nodeexporter-sesnor


