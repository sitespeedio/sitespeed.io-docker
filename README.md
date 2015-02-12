# Work in progress creating sitespeed.io container for Docker

Build
```
docker build -t sitespeedio/sitespeedio:v1 .
```

Run like this (if you named your container sitespeedio/sitespeedio:v1):

```
docker run  --privileged --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeedio:v1 /sbin/my_init --  xvfb-run --server-args="-screen 0 1024x768x24" sitespeed.io -u http://www.sitespeed.io -b firefox -d 0 -n 1
```
