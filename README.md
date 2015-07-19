# docker-sshd-weaved
Docker for SSHD with Weaved Access

A container from Ubuntu 12.04 with openssh-server preinstalled to be used as a base image.
Inspired by [docker-wordpress-nginx](https://github.com/eugeneware/docker-wordpress-nginx) container by [Eugene Ware](http://eugeneware.com).
via [docker-sshd] (https://github.com/sullof/docker-sshd) cotainer by [Francesco Sullo]

## Installation

```bash
$ git clone https://github.com/weaved/docker-sshd-weaved.git
$ cd docker-sshd-weaved
```

## Usage

Build the container:
```bash
$ sudo docker build -t weaved/docker-sshd-weaved .
```
It's better if you change the tag using your Docker username.

To spawn a new instance and see the IP:

```bash
$ CONTAINER_ID=$(sudo docker run -d docker-ssh)
$ sudo docker inspect $CONTAINER_ID | grep IPAddress | awk '{ print $2 }' | tr -d ',"'
```
You will have a result like this:
```
172.17.0.74
```
And, finally, you should connect to the container with 
```bash
$ ssh root@172.17.0.74
```

## What after?

You can create new images starting your Dockerfile with something like
```
FROM sullof/sshd
```
and modify appropriately the ```supervisord.conf``` file without overwriting the previous one. For example, in your derivated images, you 
could use the following approach appending a new file:
```bash
$ ADD ./supervisord.conf.append /etc/supervisord.conf.append
$ RUN cat /etc/supervisord.conf.append >> /etc/supervisord.conf &&\
      rm /etc/supervisord.conf.append
```
There is an example at [docker-wpngx](https://github.com/sullof/docker-wpngx).

## License 

(The MIT License)
