#!/usr/bin/env bash
# Description: Get the current state of the machine.

echo -e "$(date -u)"

echo -e "\nSystem Characteristics: $(uname -a)"

echo -e "\nCentOS Release: $(cat /etc/redhat-release)"

echo -e "\nPackage Managers:"
dnf --version

echo -e "\nEnabled Repos:"
dnf repolist

echo -e "\nEnabled Application Streams:"
dnf module list --enabled
