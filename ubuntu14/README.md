# sitespeed.io Docker on Ubuntu 14.04

You will get:
* sitespeed.io
* Chrome
* Chromedriver
* Firefox

Build
```
docker build -t sitespeedio/sitespeedio:v1 .
```

Run like this (if you named your container sitespeedio/sitespeedio:v1):

```
 docker run --privileged --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeedio:v1 sitespeed.io -u http://www.sitespeed.io -d 0 -b chrome
```
