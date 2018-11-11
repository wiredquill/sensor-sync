#!/bin/bash

git pull https://github.com/wiredquill/sensor-sync.git

#node_exporter --collector.textfile.directory /var/lib/node_exporter/textfile &

# This generates a file every 1 minutes

while true; do
# This will read the Sense Hat sensors and wirte them to the LED and a file called /tmp/sensors.prom
python3 sensehat-prometheus.py

# Copy the sensor data to node exporter so prometheus can pick it up
cp /tmp/sensors.prom /var/lib/node_exporter/textfile/

# Sleep for 60 seconds
sleep 30

done
