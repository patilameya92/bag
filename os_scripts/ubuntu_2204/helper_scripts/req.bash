#!/usr/bin/env bash
# 2023-08-02

# Description: Update system packages and install required packages from req.txt file.

apt -y update
apt -y upgrade
xargs -a req.txt apt install -y
apt -y autoremove
