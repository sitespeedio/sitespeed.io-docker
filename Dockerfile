FROM ubuntu:14.04

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Woho, this is a long run to try to keep the image as small as possible
# Note: We need git for a one dependency in Browsertime (maybe more?)

RUN \
apt-get update && \
apt-get install -y wget unzip && \
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
wget -N http://chromedriver.storage.googleapis.com/2.14/chromedriver_linux64.zip && \
unzip chromedriver_linux64.zip && \
rm chromedriver_linux64.zip && \
chmod +x chromedriver && \
mv -f chromedriver /usr/bin/chromedriver && \
apt-get update && apt-get install -y \
default-jre-headless \
git \
libgl1-mesa-dri \
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
apt-get purge -y npm git wget unzip && \
apt-get install -y \
google-chrome-stable && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Can't get --no-install-recommends to work for chrome-stable
# fix https://code.google.com/p/chromium/issues/detail?id=318548
# RUN mkdir -p /usr/share/desktop-directories

ADD ./scripts/ /home/root/scripts

VOLUME /sitespeed.io

WORKDIR /sitespeed.io

ENTRYPOINT ["/home/root/scripts/start.sh"]
