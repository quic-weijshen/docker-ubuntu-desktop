

# QRB Ros Simulation Remote Desktop based on Docker

This project provides a docker image which supports ubuntu desktop (xfce4), so that you can run virtual ubuntu desktop in container, you can access it by using ssh or remote desktop just like a virtual machine.

Hardware GPU accelerated rendering for 3D GUI application is supported in container, it's based on EGL by using [VirtualGL](https://github.com/VirtualGL/virtualgl), and doesn't require `/tmp/.X11-unix`. if you needn't hardware GPU accelerated rendering, you can also run this container on headless host without GPU (for exmaple, Cloud Server), remote desktop and 3d GUI based on software rendering (high cpu usgae) is also supported.

## Features

* Remote access by ssh and remote desktop (kasmvnc).
* OpenGL rendering based on Nvidia GPU hardware-accelerated.
* Ros and simulation environment ready with jazzy and gazebo harmonic.

## Preliminary

* install `nvidia driver`
* install `docker` and `nvidia-container-runtime`.

## Quickly Start

create container
```bash
# create container with kasmvnc
docker run -d --gpus all  \
    -p [ssh mapped port]:22 \
    -p [web socket mapped port]:6901 \
    qrb_ros_simulation_remote_desktop:latest
```
* the default username is `qrobot-docker` and password is `123456`.

access container by ssh
```bash
ssh qrobot-docker@host-ip -p [ssh mapped port]
```

access container by remote desktop (kasmvnc)

* use browser to access `https://<host-ip>:[web socket mapped port]` (chrome is recommended)

## Advanced Usage

### Enable GPU hardware-accelerated rendering

#### Test VirtualGL

```bash
vglrun -display $DISPLAY glxinfo | grep -i "opengl"
```

* Hardware-accelerated is enable successfully if it's output contain `NVIDIA Product Series`.

#### Test vulkan

```bash
# vulkan demo
vkcube
```

* It's output should contain `NVIDIA Product Series` info if vulkan works well.

## Build

```bash
git clone https://github.com/quic-weijshen/docker-ubuntu-desktop.git
cd docker-ubuntu-desktop
./docker_build.sh
```

## Acknowledgement

thanks to the authors of following related projects:
* https://github.com/gezp/docker-ubuntu-desktop
* https://github.com/selkies-project/docker-nvidia-egl-desktop
* https://github.com/kasmtech/KasmVNC
* https://github.com/VirtualGL/virtualgl
* https://github.com/linuxserver/docker-baseimage-kasmvnc

