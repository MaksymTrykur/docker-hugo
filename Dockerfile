FROM alpine:latest

LABEL maintainer="JG <julien@mangue.eu>"

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV HUGO_VERSION 0.89.4
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv /usr/local/src/hugo /usr/local/bin/hugo

ENV MINIFY_VERSION 2.9.0
RUN curl -L https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_linux_amd64.tar.gz | tar -xz \
    && mv minify /usr/local/bin/

RUN addgroup -Sg 1000 hugo \
    && adduser -Sg hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313