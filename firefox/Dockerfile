FROM sitespeedio/firefox:37.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# We nee Java for the crawler (soon to be removed we hope)

RUN \
apt-get update && \
apt-get install -y \
default-jre-headless \
git \
nodejs \
build-essential \
npm --no-install-recommends && \
ln -s /usr/bin/nodejs /usr/local/bin/node && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y npm git build-essential && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
