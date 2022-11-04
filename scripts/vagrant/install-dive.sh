#!/bin/bash

# Suppress `dpkg-preconfigure` warning related to stdin for `apt-get install`
#  https://serverfault.com/a/670688
export DEBIAN_FRONTEND=noninteractive


# Install dive
#  https://github.com/wagoodman/dive#installation
curl -sS -L https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb -o /tmp/dive_0.9.2_linux_amd64.deb
apt-get install -y /tmp/dive_0.9.2_linux_amd64.deb
rm -f /tmp/dive_0.9.2_linux_amd64.deb
