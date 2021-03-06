FROM node:4.3.2-slim

MAINTAINER Ferenc Radius "ferenc@servicebook.link"

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN mkdir /data
WORKDIR /data

COPY package.json /data/
RUN cd /data && npm install

COPY . /data/
