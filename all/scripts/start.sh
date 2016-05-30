#!/bin/bash
set -e
date
# print versions
google-chrome-stable --version
# Starting Firefox will get us this message
# GLib-CRITICAL **: g_slice_set_config: assertion 'sys_page_size == 0' failed
# https://bugzilla.mozilla.org/show_bug.cgi?id=833117
# firefox -version
firefox --version 2>/dev/null
echo 'Starting Xvfb ...'
export DISPLAY=:99
2>/dev/null 1>&2 Xvfb :99 -shmem -screen 0 1366x768x16 &

echo 'Set kind of cable connectivity'
tc qdisc add dev eth0 handle 1: root htb default 11
tc class add dev eth0 parent 1: classid 1:1 htb rate 5Mbps
tc class add dev eth0 parent 1:1 classid 1:11 htb rate 5Mbps
tc qdisc add dev eth0 parent 1:11 handle 10: netem delay 28ms

exec "$@"
