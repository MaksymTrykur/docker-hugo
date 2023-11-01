FROM alpine:latest

MAINTAINER JG <julien@mangue.eu>

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.55.6
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

    && wget https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz \
    && tar -xzvf hugo_extended_${VERSION}_Linux-64bit.tar.gz \
    && mv hugo /usr/local/bin/hugo \

    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
