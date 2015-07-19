# docker-sshd-weaved
# 
# VERSION  0.1
#
#
FROM ubuntu:12.04
MAINTAINER Weaved Inc., https://github.com/weaved/docker-sshd-weaved, http://ww.weaved.com
#
# Install and configure openssh and install wget
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
#
# root password is weaved, should change this or use keys to suite your taste
RUN echo 'root:weaved' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

#
# install Weaved from github
#
#
RUN wget --no-check-certificate https://github.com/weaved/misc_bins_and_scripts/raw/master/connectd/weavedConnectd.ubuntu12.04-linux64 
RUN mv /weavedConnectd.ubuntu12.04-linux64 /root/weavedConnectd
RUN chmod +x /root/weavedConnectd
#
# get startup script
#
ADD startup /root/startup
RUN chmod +x /root/startup

#
# Must have stuff for debug
#RUN apt-get install vim
#RUN apt-get install curl
#RUN apt-get install net-tools

# we do not need to expose 22, since we access from weaved only :EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
#
# We run our startup script which on demand configures and then runs sshd
#
ENTRYPOINT ["/root/startup"]




