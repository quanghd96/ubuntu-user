FROM ubuntu:latest

RUN apt-get update
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*
RUN apt-get install man -y
RUN apt-get install less
RUN apt-get install sudo

RUN useradd -ms /bin/bash newuser

USER newuser

WORKDIR /home/newuser
