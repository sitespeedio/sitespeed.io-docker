FROM ubuntu:14.04

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Setting up sitespeed.io without browsers on Ubuntu

RUN \
apt-get update && \
apt-get install -y \
default-jre-headless \
git \
nodejs \
npm --no-install-recommends && \
ln -s /usr/bin/nodejs /usr/local/bin/node && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y npm git && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
