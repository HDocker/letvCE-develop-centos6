FROM hoysoft/centos-ssh-mysql:centos-6-develop
MAINTAINER hoysoft

LABEL Build docker build --rm --tag hoysoft/letvCE-develop-centos6 .

RUN yum -y install --setopt=tsflags=nodocs go 1.7.1 && \ 
    yum -y update && yum clean all

RUN mkdir -p /home/workdata/go

ENV GOPATH="/home/workdata/go"

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]
