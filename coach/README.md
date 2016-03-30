# The coach

This is the [coach](https://github.com/sitespeedio/coach) with Chrome and Firefox installed.

![The coach logo](https://github.com/sitespeedio/coach/raw/master/img/coach.png)

## Usage
Read the [docs](https://github.com/sitespeedio/coach).

### Analyze a site using Firefox
```
docker run sitespeedio/coach webcoach https://www.sitespeed.io
```

### Analyze a page using Chrome
```
docker run sitespeedio/coach webcoach https://www.sitespeed.io -b chrome
```

### Drop the output to a file
```
docker run --rm -v "$(pwd)":/coach sitespeedio/coach webcoach https://www.sitespeed.io -o advice.json -f json
```