# Use phusion/baseimage as base image. To make your builds reproducible, make
FROM ubuntu:14.04
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y wget

# Add Google public key to apt, needed to get Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Google to the apt-get source list, needed to get Chrome
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update
RUN apt-get update

# Install git, curl, java, firefox, chrome, unzip, xvfb, node and npm
RUN apt-get install -y \
  curl \
  default-jre-headless \
  firefox \
  git \
  google-chrome-stable \
  nodejs \
  npm \
  unzip \
  xvfb

# Extras for xvfb
RUN apt-get install -y \
  libgl1-mesa-dri \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic

# Setup node (is there a better way to do this?)
RUN ln -s /usr/bin/nodejs /usr/local/bin/node

# install sitespeed.io
RUN npm install -g sitespeed.io

# Now fetch the chrome driver
RUN wget -N http://chromedriver.storage.googleapis.com/2.14/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN rm chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN mv -f chromedriver /usr/bin/chromedriver

# and then turn off chrome auto update
RUN mv /etc/apt/sources.list.d/google-chrome.list /etc/apt/sources.list.d/google-chrome.list.save


# fix https://code.google.com/p/chromium/issues/detail?id=318548
RUN mkdir -p /usr/share/desktop-directories
ADD ./scripts/ /home/root/scripts

VOLUME /sitespeed.io

WORKDIR /sitespeed.io

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/home/root/scripts/start.sh"]
