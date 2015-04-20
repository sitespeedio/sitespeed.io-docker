FROM ubuntu:14.04

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Setting up sitespeed.io without browsers on Ubuntu
# We need Java for the crawler (soon to be removed we hope)

# Note: libicu52 is needed for phantomjs 2
RUN \
apt-get update && \
apt-get install -y \
default-jre-headless \
git \
libicu52 \
nodejs \
npm --no-install-recommends && \
ln -s /usr/bin/nodejs /usr/local/bin/node && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y npm git && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./phantomjs-2.0.0-ubuntu-14.04/phantomjs /usr/local/phantomjs/bin/

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
