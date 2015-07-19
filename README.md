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

To spawn a new instance you need a a registration token from Weaved.

It should look like this:  fb8f43af59af6140ad22bc44dfd85bea

Each seperate instance of the docker image needs this to be sepratly accessable.  You should
of registered a a name associated with your token.

Spin up your image into a new container (replace the token with your token):

```
docker run -e WEAVED_TOKEN="fb8f43af59af6140ad22bc44dfd85bea" -d -P --name weaved1 weaved/docker-sshd-weaved 
```
Your device associated with the Weaved Registration token should come active and be accessable by SSH.

Things you can do to manage the process:

```
docker logs weaved1
docker stop weaved1
dokcer start weaved1
```

## What after?

Using the same image you can starup multiple images with there own access name, just startup with a new token.

SSH is just an example service that can be exposed inside docker via Weaved.

More to come.

## License 

(The MIT License)
