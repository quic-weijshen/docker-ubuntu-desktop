#!/bin/bash
# usage: ./docker_build.sh

docker build --file qrb_ros_simulation_remote_desktop/dockerfiles/Dockerfile -t qrb_ros_simulation_remote_desktop:latest qrb_ros_simulation_remote_desktop

if [[ $? != 0 ]]; then
    echo "Failed to build docker image 'qrb_ros_simulation_remote_desktop'"
    exit -3
fi

exit 0
