FROM sitespeedio/chrome:48.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# We need Java for the crawler (soon to be removed we hope)
# Note: libicu52  is needed for phantomjs 2
RUN \
apt-get update && \
apt-get install -y curl && \
curl --silent --location https://deb.nodesource.com/setup_4.x | bash - && \
apt-get install -y \
default-jre-headless \
git \
libicu52 \
nodejs \
build-essential --no-install-recommends && \
wget -N http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip && \
unzip chromedriver_linux64.zip && \
rm chromedriver_linux64.zip && \
chmod +x chromedriver && \
mv -f chromedriver /usr/bin/chromedriver && \
npm set progress=false && \
npm install -g sitespeed.io && npm cache clean && \
apt-get purge -y curl git build-essential && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./scripts/ /home/root/scripts
ADD ./selenium-server-standalone-2.48.2.jar /home/root/

VOLUME /sitespeed.io

WORKDIR /sitespeed.io
