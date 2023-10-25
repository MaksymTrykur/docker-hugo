FROM alpine:latest

LABEL maintainer="JG <julien@mangue.eu>"

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    openssh \
    tar

ENV VERSION=0.55.6

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \

RUN curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/

RUN addgroup -g 1000 hugo \
    && adduser -u 1000 -G hugo -s /bin/sh -D hugo

WORKDIR /src

EXPOSE 1313

USER hugo

CMD ["hugo"]
