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
apt-get install -y curl && \
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash - && \
apt-get install -y \
default-jre-headless \
git \
nodejs \
libicu52 --no-install-recommends && \
npm set progress=false && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y curl git && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
