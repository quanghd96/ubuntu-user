FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install man-db -y
RUN apt-get install less
RUN apt-get install nano -y

#RUN apt-get install info
RUN apt-get install sudo
RUN echo "lpic ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN cat /etc/sudoers
RUN echo 'root:atv' |chpasswd

RUN useradd -ms /bin/bash lpic
RUN echo 'lpic:atv' |chpasswd
USER lpic

WORKDIR /home/lpic
