#!/bin/bash

# This generates a file every 1 minutes

while true; do
python3 sensehat-prometheus.py
cp /tmp/sensors.prom /var/lib/node_exporter/textfile/
sleep 60
done
