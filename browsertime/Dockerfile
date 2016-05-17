FROM sitespeedio/visualmetrics

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

RUN apt-get update -y && apt-get install -y \
  build-essential \
  ca-certificates \
  curl \
  gcc \
  default-jre-headless \
  --no-install-recommends --force-yes && rm -rf /var/lib/apt/lists/*

# Install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -  && \
  apt-get install nodejs -y

# And get Browsertime
RUN npm install browsertime@1.0.0-alpha.17 -g

ADD ./scripts/ /home/root/scripts

VOLUME /browsertime

WORKDIR /browsertime
