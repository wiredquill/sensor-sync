#!/usr/bin/env bash


# echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy 

sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install sense-hat

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

sudo mkdir -p /var/lib/node_exporter/textfile
sudo chmod 777 /var/lib/node_exporter/textfile 

echo copying to /etc/systemsd/system
sudo cp nodeexporter.service /etc/systemd/system
sudo cp nodeexporter-sensor.service /etc/systemd/system

echo copying to /usr/local/bin
sudo cp sensor-prometheus-export.sh /usr/local/bin
sudo cp sensehat-prometheus.py /usr/local/bin

echo chmoding
sudo chmod +x /etc/systemd/system/nodeexporter.service
sudo chmod +x /etc/systemd/system/nodeexporter-sensor.service
sudo chmod +x /usr/local/bin/sensor-prometheus-export.sh

echo loading services
sudo systemctl daemon-reload 
sudo systemctl enable --now nodeexporter 
sudo systemctl enable --now nodeexporter-sensor.service

echo 
echo sudo status nodeexporter 
sudo status nodeexporter 
echo sudo systemctl status nodeexporter-sensor.service
sudo systemctl status nodeexporter-sensor.service