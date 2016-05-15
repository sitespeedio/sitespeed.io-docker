FROM sitespeedio/browsers:firefox-45.0-chrome-50.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

RUN apt-get update -y && apt-get install -y \
  build-essential \
  ca-certificates \
  curl \
  gcc \
  git \
  --no-install-recommends --force-yes && rm -rf /var/lib/apt/lists/*

# Install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -  && \
  apt-get install nodejs -y

# And get Browsertime
RUN npm install browsertime@1.0.0-alpha.15 -g

RUN mkdir $HOME/go
ENV PATH $HOME/go/bin:/usr/local/go/bin:$PATH
ENV GOPATH $HOME/go

# INSTALL GO
RUN curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
RUN tar -xvf go1.6.linux-amd64.tar.gz
RUN mv go /usr/local

RUN go get github.com/tylertreat/comcast

ADD ./scripts/ /home/root/scripts

VOLUME /browsertime

WORKDIR /browsertime
