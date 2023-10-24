FROM alpine:latest

LABEL maintainer='JG <julien@mangue.eu>'

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync 

ENV VERSION 0.55.0

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && chown 1000:1000 /usr/local/bin/hugo \
    && chmod 755 /usr/local/bin/hugo \

WORKDIR /src

EXPOSE 1313