#!/bin/bash
set -e
date
# print versions
chromedriver --version
google-chrome-stable --version

echo 'Starting Xvfb ...'
export DISPLAY=:99
2>/dev/null 1>&2 Xvfb :99 -shmem -screen 0 1366x768x16 &
exec "$@"
