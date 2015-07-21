FROM resin/rpi-raspbian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 2.0.0

RUN apt-get update && \
  apt-get install -y build-essential g++ flex bison gperf ruby perl git-core \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev ttf-mscorefonts-installer fontconfig chrpath openssl \
  python-software-properties python-pip && \
  rm -rf /var/lib/apt/lists/*

RUN pip install awscli

COPY build /build
RUN chmod +x build

CMD /build
