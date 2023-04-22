#!/bin/sh

rm -f /tmp/bom.txt

# shellcheck disable=SC2129
echo "**latest-slim**" >> /tmp/bom.txt
echo "ubuntu-$(lsb_release -sr)-$(lsb_release -sc)" >> /tmp/bom.txt
echo "node-$(node --version |sed -r 's/[rv]//g')" >> /tmp/bom.txt
echo "npm-$(npm --version)" >> /tmp/bom.txt

echo "**latest-runtime**" >> /tmp/bom.txt
echo "_latest-slim_" >> /tmp/bom.txt
echo "firefox-$(firefox --version |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt
echo "playwright-$(npx playwright --version |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt

echo "**latest-build**" >> /tmp/bom.txt
echo "_latest-runtime_" >> /tmp/bom.txt
echo "git-$(git --version |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt
echo "gcc-$(gcc --version |grep gcc |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt
echo "python3-$(python3 --version |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt
echo "pip-$(pip list |grep pip |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt
echo "node-gyp-$(node-gyp --version |sed -rn 's/.*[^0-9.]([0-9.]+)$/\1/p')" >> /tmp/bom.txt

# the last `xargs` step is to remove the trailing whitespace (see https://stackoverflow.com/a/12973694)
tr '\n' ' ' < /tmp/bom.txt |xargs

rm /tmp/bom.txt
