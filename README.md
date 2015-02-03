# Work in progress creating sitespeed.io container for Docker

Current status: Firefox works, Chrome fails because the chromedriver cannot start Chrome

Run like this (if you named your container sitespeedio/sitespeedio:v1):

```
docker run sitespeedio/sitespeedio:v1 /sbin/my_init --  xvfb-run --server-args="-screen 0 1024x768x24" sitespeed.io -u http://www.sitespeed.io -b firefox -d 0 -n 1
```
