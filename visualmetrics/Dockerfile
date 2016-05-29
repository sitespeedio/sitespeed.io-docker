FROM sitespeedio/browsers:firefox-46.0-chrome-51.0
MAINTAINER Peter Hedenskog <peter@soulgalore.com>

# Lets install all dependencies for VisualMetrics
RUN apt-get update -y && apt-get install -y \
  git \
  imagemagick \
  ipython \
  ipython-notebook \
  libjpeg-dev \
  python \
  python-dev \
  python-imaging \
  python-numpy \
  python-scipy \
  python-matplotlib \
  python-pandas \
  python-pip \
  python-sympy \
  python-nose \
  wget \
  xz-utils \
  --no-install-recommends --force-yes && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  pip install Pillow  && \
  pip install pyssim

# Install a static version of FFMPEG
RUN wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz && \
  tar xf ffmpeg-release-64bit-static.tar.xz && \
  mv ffmpeg*/ffmpeg /usr/bin/ && \
  rm ffmpeg-release-64bit-static.tar.xz

# And get VisualMetrics
# RUN git clone https://github.com/WPO-Foundation/visualmetrics.git

WORKDIR visualmetrics

# CMD ["python", "/visualmetrics/visualmetrics.py", "--check"]
