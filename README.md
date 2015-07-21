# Docker image for building Phantomjs for Raspberry Pi

Building docker image for Pi, based on [sconnelley/docker-phantomjs2](https://github.com/sconnelley/docker-phantomjs2)

## building

### Build image
Make sure the `build` file is excutable, because I didn't which led to a permissions bonk.
```bash
chmod +x build
```

Then run:
```bash
docker build -t phantomjs2 .
```

### Build phantomjs2 binary
```bash
docker run -e PHANTOM_JS_VERSION=2.0.0-dev phantomjs2
```

After it is done, which will be a long ass time, you can copy the binary back to host machine:
```bash
docker cp CONTAINER_ID:/home/phantomjs/bin/phantomjs-PHANTOM_JS_VERSION-lucid.tar.gz .
```

### Build phantomjs2 binary w/export to s3
Don't have time to figure out the 'RequestTimeTooSkewed' error, so try at your own risk
```bash
docker run -e VERSION=2.0.0-dev -e AWS_ACCESS_KEY_ID=key -e AWS_SECRET_ACCESS_KEY=secret -e BUCKET=s3bucket phantomjs2
```

### If you need to rummage around in docker container
```bash
docker run  -t -i phantomjs2 /bin/bash
```

### Additional references:
* [sconnelley/docker-phantomjs2](https://github.com/sconnelley/docker-phantomjs2)
* [Phantom JS 2 installation instructions](https://github.com/ariya/phantomjs/wiki/PhantomJS-2)
* [Docker home](https://docs.docker.com)
* [Intro to Docker that was helpful](https://serversforhackers.com/articles/2014/03/20/getting-started-with-docker/)
