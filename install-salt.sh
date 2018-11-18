#!/bin/bash

echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy

wget -O - https://repo.saltstack.com/apt/debian/9/armhf/latest/SALTSTACK-GPG-KEY.pub | apt-key add -

echo 'deb http://repo.saltstack.com/apt/debian/9/armhf/2018.3/ stretch main' >> /etc/apt/sources.list.d/saltstack.list

apt-get update
apt-get --assume-yes upgrade

apt-get install salt-minion
