#!/usr/bin/env bash
# Description: Check and install available updates for installed packages.

dnf upgrade -y

# Perform post upgrade cleanup
dnf autoremove -y
dnf clean all
