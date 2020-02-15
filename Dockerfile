FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository -y ppa:robbert-harms/cbclab && \
    apt-get update && \
    apt-get install -y python3-mdt python3-pip

RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN pip3 install tatsu

RUN pip3 install mdt


