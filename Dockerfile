#===============================================================================
# Target 1: scmi-base:slim
#   - nodejs and npm
FROM alpine:latest AS scmi-slim

RUN apk --update add --no-cache \
    ca-certificates \
    curl \
    nodejs~=18 \
    npm \
    && rm -rf /var/cache/apk/* /tmp/*

#===============================================================================
# Target 2: scmi-base:runtime
#   - nodejs and npm, plus Chromium
FROM scmi-slim AS scmi-runtime

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN apk --update add --no-cache \
    chromium \
    freetype \
    harfbuzz \
    nss \
    ttf-freefont \
    && rm -rf /var/cache/apk/* /tmp/*

#===============================================================================
# Target 3: scmi-base:build
#   - nodejs and npm, plus Chromium
FROM scmi-runtime AS scmi-build

RUN apk --update add --no-cache \
    autoconf \
    build-base \
    git \
    py3-pip \
    python3~=3.10 \
    && npm install -g node-gyp \
    && rm -rf /var/cache/apk/* /tmp/*

COPY bom.sh /
