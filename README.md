# docker-project-chrono-vnc🐋
This container has a built-in physics simulation engine ([Project CHRONO](http://www.projectchrono.org)) that can be checked with VNC access.

This container image based on [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc).

## Support
+ Ubuntu Bionic
+ Ubuntu Xenial

## How to build
```
make build
```

## Usage
Example: bionic
```
docker run -p 6080:80 naokitakahashi12/project-chrono-vnc:bionic
```
Access to [localhost:6080](http://localhost:6080).
