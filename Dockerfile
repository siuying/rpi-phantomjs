FROM resin/rpi-raspbian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 2.0.0

RUN apt-get update && \
  apt-get install -y build-essential g++ flex bison gperf ruby perl git-core \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev ttf-mscorefonts-installer fontconfig chrpath openssl && \
  rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/ariya/phantomjs.git && \
  cd phantomjs && \
  git checkout $PHANTOM_JS_VERSION && \
  ./build.sh --confirm --jobs 2

VOLUME ["/phantomjs"]
ENTRYPOINT ["/phantomjs/bin/phantomjs"]
