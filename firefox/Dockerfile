FROM ubuntu:14.04

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Install Firefox, Xvfb & sitespeed.io

RUN \
apt-get update && apt-get install -y \
default-jre-headless \
git \
nodejs \
npm \
xfonts-100dpi \
xfonts-75dpi \
xfonts-scalable \
xfonts-cyrillic \
firefox \
xvfb --no-install-recommends && \
ln -s /usr/bin/nodejs /usr/local/bin/node && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y npm git && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./scripts/ /home/root/scripts

VOLUME /sitespeed.io

WORKDIR /sitespeed.io

ENTRYPOINT ["/home/root/scripts/start.sh"]
