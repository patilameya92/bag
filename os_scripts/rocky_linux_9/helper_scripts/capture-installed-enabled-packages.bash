#!/usr/bin/env bash
# Description: Capture installed and enabled packages.

CURRENT_TIME=$(date -u -Iseconds)
CAPTURE_DIRECTORY_PREFIX="os-metadata"
CAPTURE_DIRECTORY="${CAPTURE_DIRECTORY_PREFIX}-${CURRENT_TIME}"
mkdir -p "${CAPTURE_DIRECTORY}"

# Capture installed packages
dnf list installed | tail -n +2 | awk '{print $1}' > "${CAPTURE_DIRECTORY}/installed-packages.txt"

# Capture systemctl enabled services
systemctl list-unit-files --state=enabled | tail -n +2 | head -n -2 | awk '{print $1}' > "${CAPTURE_DIRECTORY}/enabled-services.txt"

# Capture running services
systemctl list-units --type=service --state=running | tail -n +2 | head -n -5 | awk '{print $1}' > "${CAPTURE_DIRECTORY}/running-services.txt"
