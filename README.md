# Docker [jkuetemeier/centos-supervisor](https://registry.hub.docker.com/u/jkuetemeier/centos-supervisor/)

CentOS 7 Docker base image with Supervisor autoupdates and cron

Docker Hub link: [https://registry.hub.docker.com/u/jkuetemeier/centos-supervisor/](https://registry.hub.docker.com/u/jkuetemeier/centos-supervisor/)

## How to run

#### Prerequirements - Docker

Install `docker`, e.g. on CentOS: http://wiki.centos.org/Cloud/Docker

#### Get pre compiled image

    docker pull jkuetemeier/centos-supervisor

#### Run

    docker run -it jkuetemeier/centos-supervisor

#### or build your own from this Dockerfile

    docker build -t my-centos-supervisor .
    docker run -it my-centos-supervisor

## What's in this container?

This container is based on [jkuetemeier/centos-base](https://registry.hub.docker.com/u/jkuetemeier/centos-base/) - GitHub [https://github.com/jkuetemeier/docker-centos-base](https://github.com/jkuetemeier/docker-centos-base).

### This container include the following additional features

- [Supervisor](http://supervisord.org/) A Process Control System
- cronie - cron (enabled in Supervisor)
- yum-cron for autoupdates (with cron)

You can easily build your own image upon this image and start your programs
with Supervisor. Just add a file to `/etc/supervisord.d`.
