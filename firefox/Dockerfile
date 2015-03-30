FROM sitespeedio/sitespeed.io-standalone

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# firefox & xvfb

RUN \
apt-get update && \
apt-get install -y \
firefox \
ca-certificates \
xfonts-100dpi \
xfonts-75dpi \
xfonts-scalable \
xfonts-cyrillic \
xvfb --no-install-recommends && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./scripts/ /home/root/scripts

VOLUME /sitespeed.io

WORKDIR /sitespeed.io

ENTRYPOINT ["/home/root/scripts/start.sh"]
