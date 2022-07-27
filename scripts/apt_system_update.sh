#!/bin/bash

# Basic system update
echo update
apt-get update

echo upgrade
apt-get upgrade -y

echo autoclean
apt-get autoclean

echo autoremove
apt-get autoremove -y
