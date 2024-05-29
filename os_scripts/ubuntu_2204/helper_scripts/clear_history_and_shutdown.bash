#!/usr/bin/env bash

# Description: clear all history and shutdown the machine.

cat /dev/null > ~/.bash_history && history -c && systemctl poweroff
