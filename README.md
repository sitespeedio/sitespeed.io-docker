# sitespeed.io

This Docker get you [sitespeed.io](http://www.sitespeed.io) with Chrome and Firefox installed.

## Usage

The ```--rm -v "$(pwd)":/sitespeed.io``` will make the result HTML stored on your host.

### Analyze a site and fetch timings using Chrome
```
docker run --privileged --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io http://www.sitespeed.io/ -b chrome
```

### Analyze a site and fetch timings using Firefox
```
docker run --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io s http://www.sitespeed.io/ -b firefox
```

## Pro tip
Always run sitespeed.io on specific version (always do that with Docker) meaning specify the tag after your container name. Then you have control of what versions you are using (both of sitespeed.io and the browsers). In practice, this means you should run it like this:
```
docker run --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io:4.0.0 http://www.sitespeed.io/ -b firefox
```
If you not use the tag after the container, the latest version will be downloaded and you will not have full control of the exact version.


## Configuration
sitespeed.io is highly configurable, check the [documentation](http://www.sitespeed.io/documentation/sitespeed.io/).

## Update your container (use a new version)
Say there's a new release of sitespeed.io and you want to run that, how do you do that? First check the [changelog](https://github.com/sitespeedio/sitespeed.io/blob/master/CHANGELOG.md). Are there any changes that will break what you do? If not, just pull the new version (change X.Y.Z to the version you want to use):

```
docker pull sitespeedio/sitespeed.io:X.Y.Z
```

And then change where you start your container like this:

```
docker run --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io:X.Y.Z ...
```
