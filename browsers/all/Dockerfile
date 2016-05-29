FROM sitespeedio/chrome:51.0

MAINTAINER Peter Hedenskog <peter@soulgalore.com>

RUN \
apt-get update && \
apt-get install -y firefox --no-install-recommends && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./scripts/ /home/root/scripts

ENTRYPOINT ["/home/root/scripts/start.sh"]
