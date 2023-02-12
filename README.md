![GitHub](https://img.shields.io/github/license/ringier-data/rcplus-scmi-base-image)
[![build](https://github.com/ringier-data/rcplus-scmi-base-image/actions/workflows/auto-upgade.yml/badge.svg)](https://github.com/ringier-data/rcplus-scmi-base-image/actions/workflows/auto-upgade.yml)

# rcplus-scmi-base-image

Base image for SCMI components with Alpine, node.js, and Chromium.

The Github Actions regularly check the updates, and in case of new version(s), it builds new images with the following variants:

* `rcplus-scmi-base-image:latest-slim` (latest version of Alpine, node.js)
* `rcplus-scmi-base-image:latest-runtime` (all from `latest-slim`, plus Chromium)
* `rcplus-scmi-base-image:latest-build` (all from `latest-runtime`, plus Python3, GCC, git, and node-gyp)

## Bill-of-Material

<!--- Do not manually modify anything below this line! --->
<!--- BOM-starts --->
- alpine-3.16.3
- bash-5.1.16
- curl-7.83.1
- haproxy-2.4.18
- privoxy-3.0.33
- sed-4.8
- tor-0.4.7.10
<!--- BOM-ends. Document ends here too --->
