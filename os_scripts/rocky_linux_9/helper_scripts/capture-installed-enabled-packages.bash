#!/usr/bin/env bash
# Description: Capture installed and enabled packages.

CURRENT_TIME=$(date -u -Iseconds)
CAPTURE_DIRECTORY_PREFIX="os-metadata"
CAPTURE_DIRECTORY="${CAPTURE_DIRECTORY_PREFIX}-${CURRENT_TIME}"
mkdir -p "${CAPTURE_DIRECTORY}"

# Capture installed packages
dnf list installed | awk '{print $1}' > "${CAPTURE_DIRECTORY}/installed-packages.txt"

# Capture systemctl enabled services
systemctl list-unit-files --state=enabled | awk 'NR > 1 && $1 != "" {print $1}' | head -n -1 > "${CAPTURE_DIRECTORY}/enabled-services.txt"

# Capture running services
systemctl list-units --type=service --state=running | awk 'NR > 1 && $1 != "" {print $1}' | head -n -4 > "${CAPTURE_DIRECTORY}/running-services.txt"
