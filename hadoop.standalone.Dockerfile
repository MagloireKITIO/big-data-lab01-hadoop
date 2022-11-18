FROM ubuntu
LABEL MAINTAINER="Magloire KITIO <magloirekitio1@gmail.com>"

RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget
RUN apt-get install -y openssh-server
RUN apt-get install -y net-tools
RUN apt-get install -y vim

# Setup passphraseless ssh
RUN  ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
     cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
     chmod 0600 ~/.ssh/authorized_keys

WORKDIR /root
COPY ./data/hadoop/hadoop-3.3.4.tar.gz .
#RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
RUN tar -xzvf hadoop-3.3.4.tar.gz && \
    mv hadoop-3.3.4 /usr/local/hadoop && \
    rm hadoop-3.3.4.tar.gz