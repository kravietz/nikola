FROM debian:bullseye
MAINTAINER Stefano Marinelli <stefano@dragas.it>

RUN apt-get update
RUN apt-get install -y python3-pip locales
RUN apt-get clean
RUN rm  -Rf /var/lib/apt/lists/*

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN pip3 install PyYAML commonmark opentimestamps-client Nikola[extras]
RUN rm -Rf /root/.cache/

WORKDIR /nikola
