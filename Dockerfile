FROM ubuntu:latest

RUN apt-get update
RUN apt-get install less
RUN apt-get install sudo

RUN useradd -ms /bin/bash newuser

USER newuser

WORKDIR /home/newuser
