FROM sitespeedio/firefox:40.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# We need Java for the crawler (soon to be removed we hope)
# Note: libicu52 is needed for phantomjs 2

RUN \
apt-get update && \
apt-get install -y \
default-jre-headless \
git \
libicu52 \
nodejs \
build-essential \
npm --no-install-recommends && \
ln -s /usr/bin/nodejs /usr/local/bin/node && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y npm git build-essential && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./scripts/ /home/root/scripts
ADD ./selenium-server-standalone-2.46.0.jar /home/root/
ADD ./phantomjs-2.0.0-ubuntu-14.04/phantomjs /usr/local/phantomjs/bin/

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
