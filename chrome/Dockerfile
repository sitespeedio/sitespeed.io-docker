FROM sitespeedio/chrome:41.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# We need Java for the crawler (soon to be removed we hope)

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

ADD ./scripts/ /home/root/scripts

ADD ./selenium-server-standalone-2.45.0.jar /home/root/

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
