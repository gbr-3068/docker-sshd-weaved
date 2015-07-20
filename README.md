# docker-sshd-weaved
Docker with SSHD remote access using Weaved

This example Docker image shows how you can use Weaved to remote access a Docker container. This particular example uses ssh, which may or may not be a good idea, but shows the power of using Weaved. Notice you don't have to EXPOSE any ports, configure port forwarding, or worry about NAT for example.

The image uses Ubuntu 12.04 and includes openssh-server. Based on the [docker-wordpress-nginx](https://github.com/eugeneware/docker-wordpress-nginx) image by [Eugene Ware](http://eugeneware.com).
via [docker-sshd] (https://github.com/sullof/docker-sshd) image by [Francesco Sullo]

## Step 1: Installation

Clone the repository:

```bash
$ git clone https://github.com/weaved/docker-sshd-weaved.git
$ cd docker-sshd-weaved
```

Build the image. Replace the tag "weaved" below with your Docker username:

```bash
$ sudo docker build -t weaved/docker-sshd-weaved .
```

## Step 2: Use

To generate a new Docker container you will need a Weaved Registration Token from the Weaved website, weaved.com. You will register your Docker container at the Weaved website with a Weaved Device Name.

The Weaved Registration Token that you generate at the Weaved website should look like this:  fb8f43af59af6140ad22bc44dfd85bea

Each seperate Docker image instance needs a different Weaved Registration Token.  

Spin up your Docker image into a new container. Replace the example Weaved Registration Token below with your Weaved Registration Token. Replace the tag "weaved" below with your Docker username:

```
docker run -e WEAVED_TOKEN="fb8f43af59af6140ad22bc44dfd85bea" -d -P --name weaved1 weaved/docker-sshd-weaved 
```

Your device with Weaved Device Name that is associated with the Weaved Registration Token should become active at the Weaved website. You can now login to your Weaved account from anywhere and access your Docker container remotely using SSH.

Things you can do to manage the Weaved process in your Docker container:

```
docker logs weaved1
docker stop weaved1
dokcer start weaved1
```

## What Next?

Using the same base image you can start multiple containers with different Weaved Device Names, just start each container with a new Weaved Registration Token in the docker run command.

More to come: SSH is just an example of a service that you can access inside a Docker container using Weaved. Other services include http, vnc, etc. You dont have to use a Docker container, Weaved can be used to access any instance. Weaved can be used to securely access an AWS image. for example.

## License 

(The MIT License)
