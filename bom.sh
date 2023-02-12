#!/bin/sh

parse() {
	PATTERN=$1
	RESULT=$(apk list --installed 2>&1 |grep -v perl |grep -e "$PATTERN" |awk '{print $1}' |sed -r 's/\-r[0-9]+$//' |sort)
	echo "$RESULT"
}

rm -f /tmp/bom.txt

# shellcheck disable=SC2129
echo "**latest-slim**" >> /tmp/bom.txt
echo "alpine-$(cat /etc/alpine-release)" >> /tmp/bom.txt
parse '^nodejs\|^npm' >> /tmp/bom.txt

echo "**latest-runtime**" >> /tmp/bom.txt
echo "\`latest-slim\`" >> /tmp/bom.txt
parse '^chromium' >> /tmp/bom.txt

echo "**latest-build**" >> /tmp/bom.txt
echo "\`latest-runtime\`" >> /tmp/bom.txt
parse '^git\|^python3\|^gcc' >> /tmp/bom.txt
echo "pip-$(pip --version | awk '{print $2}')" >> /tmp/bom.txt
echo "node-gyp-$(node-gyp --version | sed 's/v/\1/')" >> /tmp/bom.txt

# the last `xargs` step is to remove the trailing whitespace (see https://stackoverflow.com/a/12973694)
tr '\n' ' ' < /tmp/bom.txt |xargs

rm /tmp/bom.txt
