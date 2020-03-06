FROM nvidia/opencl
# FROM ubuntu:18.04
LABEL maintainer "Michele Mastrogiovanni <michele.mastrogiovanni@gmail.com>"

RUN mkdir -p /src
COPY silent.cfg /src

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        ca-certificates \
        xauth \
        software-properties-common \
        lsb-core \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get install -y --no-install-recommends ocl-icd-opencl-dev && rm -rf /var/lib/apt/lists/*

# COPY opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz /src/opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz

# wget http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz

#RUN cd /src && \ 
#	tar -xvzf opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz && \
#	mv silent.cfg opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25 && \
#	cd opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25 && \
#	./install.sh --silent silent.cfg --cli-mode

ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository -y ppa:robbert-harms/cbclab && \
    apt-get update && \
    apt-get install -y python3-mdt python3-pip

RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN pip3 install tatsu

RUN pip3 install mdt


