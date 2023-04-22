# syntax=docker/dockerfile:1

#===============================================================================
# Target 1: scmi-base:slim
#   - nodejs and npm
FROM ubuntu:22.10 AS scmi-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get -qq update > /dev/null && \
  apt-get -qq install --assume-yes --no-install-recommends apt-utils > /dev/null 2>&1 && \
  apt-get -qq install --assume-yes --no-install-recommends \
    ca-certificates \
    curl \
    gpg \
    wget \
    > /dev/null && \
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - > /dev/null && \
  apt-get -qq install --assume-yes --no-install-recommends \
    nodejs \
    > /dev/null && \
  npm --silent install --global --no-fund --no-audit npm && \
  ( npm --silent cache clean --force || echo "" ) && \
  apt-get -qq clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#===============================================================================
# Target 2: scmi-base:runtime
#   - nodejs and npm, plus Firefox and playwright
FROM scmi-slim AS scmi-runtime

# Tell Playwright to skip installing browsers. We'll only install Firefox.
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
ENV PLAYWRIGHT_BROWSERS_PATH=/opt/pw-browsers

RUN \
  apt-get -qq update > /dev/null && \
  npm --silent install --global --no-fund --no-audit playwright && \
  npx --silent playwright install --with-deps firefox > /dev/null && \
  ( npm --silent cache clean --force || echo "" ) && \
  apt-get -qq clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  set -- /opt/pw-browsers/firefox-*/firefox/firefox && \
  ln -s "$1" /usr/bin/firefox

#===============================================================================
# Target 3: scmi-base:build
#   - nodejs, npm, playwright and Firefox, plus essential build tools
FROM scmi-runtime AS scmi-build

# Tell Playwright to skip installing browsers. We'll only install Firefox.
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
ENV PLAYWRIGHT_BROWSERS_PATH=/opt/pw-browsers

RUN \
  apt-get -qq update > /dev/null && \
  apt-get  install --assume-yes --no-install-recommends \
    autoconf \
    build-essential \
    git \
    python3-pip \
    python3 \
    > /dev/null && \
  npm --silent install --global --no-fund --no-audit node-gyp && \
  pip install --upgrade --no-compile --quiet --no-input --no-cache-dir --disable-pip-version-check --no-color --root-user-action=ignore pip && \
  ( npm --silent cache clean --force || echo "" ) && \
  apt-get -qq clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY bom.sh /
