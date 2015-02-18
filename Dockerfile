# Use phusion/baseimage as base image. To make your builds reproducible, make
FROM ubuntu:14.04
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

RUN apt-get update && apt-get install -y wget
# Add Google public key to apt, needed to get Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Google to the apt-get source list, needed to get Chrome
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update
RUN apt-get update && apt-get install -y \
  curl \
  default-jre-headless \
  firefox \
  git \
  google-chrome-stable \
  libgl1-mesa-dri \
  nodejs \
  npm \
  unzip \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  xvfb \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Setup node (is there a better way to do this?)
RUN ln -s /usr/bin/nodejs /usr/local/bin/node

# install sitespeed.io
RUN npm install -g sitespeed.io

# Now fetch the chrome driver and then turn off chrome auto update
RUN wget -N http://chromedriver.storage.googleapis.com/2.14/chromedriver_linux64.zip && \
unzip chromedriver_linux64.zip && \
rm chromedriver_linux64.zip && \
chmod +x chromedriver && \
mv -f chromedriver /usr/bin/chromedriver
# mv /etc/apt/sources.list.d/google-chrome.list /etc/apt/sources.list.d/google-chrome.list.save

# fix https://code.google.com/p/chromium/issues/detail?id=318548
RUN mkdir -p /usr/share/desktop-directories
ADD ./scripts/ /home/root/scripts

VOLUME /sitespeed.io

WORKDIR /sitespeed.io

ENTRYPOINT ["/home/root/scripts/start.sh"]
