#!/bin/sh
## initialize environment
if [ ! -f "/docker_config/init_flag" ]; then
    # set python is python3
    update-alternatives --install /usr/bin/python python /usr/bin/python3 2
    # update /etc/environment
    export PATH=/usr/NX/scripts/vgl:$PATH
    env | grep -Ev "CMD=|PWD=|SHLVL=|_=|DEBIAN_FRONTEND=|USER=|HOME=|UID=|GID=|PASSWORD=" > /etc/environment
    # create user
    groupadd -g $GID $USER
    useradd --create-home --no-log-init -u $UID -g $GID $USER
    usermod -aG sudo $USER
    usermod -aG ssl-cert $USER
    echo "root:$PASSWORD" | chpasswd
    echo "$USER:$PASSWORD" | chpasswd
    chsh -s /bin/bash $USER
    # source ros env
    echo "source /opt/ros/jazzy/setup.bash" >> /home/$USER/.bashrc
    # set opengl to use nvidia's lib
    echo "export __GLX_VENDOR_LIBRARY_NAME=nvidia" >> /home/$USER/.bashrc
    echo  "ok" > /docker_config/init_flag
fi

# start sshd
/usr/sbin/sshd
# start dbus
/etc/init.d/dbus start

# start remote desktop
echo "start kasmvnc"
bash /docker_config/start_kasmvnc.sh
