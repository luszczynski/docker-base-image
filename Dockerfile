FROM centos:centos7

MAINTAINER Gustavo Luszczynski

ENV TERM=xterm
ENV HOME=/home/jboss
ENV SUPPORT=$HOME/support
ENV SOFTWARE=$HOME/software

RUN alias ls="ls --color" && \
	alias grep="grep --color=auto" && \
	alias ll="ls -l --color=auto"

RUN useradd -m -d /home/jboss -p jboss jboss  && \
	echo 'root:redhat' | chpasswd && \
	mkdir -p $SOFTWARE && mkdir -p $SUPPORT

ENV REFRESHED_AT 20160114

RUN yum -y update && \
	yum -y install epel-release && \
	yum -y install unzip xterm bsdtar supervisor && yum clean all