# sitespeed.io

This Docker get you [sitespeed.io](http://www.sitespeed.io) without any browsers.

## Usage

The ```--rm -v "$(pwd)":/sitespeed.io``` will make the result HTML stored on your host.

### Analyze a site
```
docker run --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io-standalone sitespeed.io -u http://www.sitespeed.io
```

Wanna fetch timings using PhantomJS 2?
```
docker run --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io-standalone sitespeed.io -u http://www.sitespeed.io --phantomjsPath /usr/local/phantomjs/bin/phantomjs -b headless
```

## Configuration
sitespeed.io is highly configurable, check the [documentation](http://www.sitespeed.io/documentation). Note: Fetching timings using SlimerJS will need Xvfb, check the browser containers on how to include it.
