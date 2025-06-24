#!/bin/sh
apt-get update
# Install remote desktop (kasmvnc)
bash /docker_config/install_kasmvnc.sh
## Install virtualgl
wget https://sourceforge.net/projects/virtualgl/files/2.6.5/virtualgl_2.6.5_amd64.deb \
    -O /tmp/virtualgl_2.6.5_amd64.deb && \
    apt-get install /tmp/virtualgl_2.6.5_amd64.deb


