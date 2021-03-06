FROM nvidia/opencl

RUN mkdir -p /src

# install dependencies
RUN apt-get update && apt-get install -y lsb-core wget

# install mdt
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:robbert-harms/cbclab
RUN apt-get update && apt-get install -y python3-mdt python3-pip
RUN pip3 install tatsu==4.2.6

RUN mkdir -p /root/.mdt && \
	cp -R /usr/lib/python3/dist-packages/mdt/data /root/.mdt/1.2.2

