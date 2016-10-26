FROM hoysoft/centos-ssh-mysql:centos-6-develop
MAINTAINER hoysoft

RUN yum -y install --setopt=tsflags=nodocs gcc-4.8.5-4.el7.x86_64 cpp-4.8.5-4.el7.x86_64 && \
    yum -y install --setopt=tsflags=nodocs go && \ 
    yum -y install yum install --setopt=tsflags=nodocs libcurl-devel && \ 
    yum -y update && yum clean all

RUN mkdir -p /home/workdata/golang
VOLUME /home/workdata/golang

ENV GOPATH="/home/workdata/golang"

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]
