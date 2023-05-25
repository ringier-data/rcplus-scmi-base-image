![GitHub](https://img.shields.io/github/license/ringier-data/rcplus-scmi-base-image)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/zhaowde/scmi-base/latest)
![build](https://github.com/ringier-data/rcplus-scmi-base-image/actions/workflows/auto-upgade.yml/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/zhaowde/scmi-base.svg)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/zhaowde/scmi-base/latest)

# rcplus-scmi-base-image

Base image for SCMI components with Ubuntu, node.js, Playwright, and Firefox.

The Github Actions regularly check the updates, and in case of new version(s), it builds new images with the following tags:

* `zhaowde/scmi-base:latest-slim` (latest version of Ubuntu, node.js)
* `zhaowde/scmi-base:latest-runtime` (all from `latest-slim`, plus Firefox)
* `zhaowde/scmi-base:latest-build` (all from `latest-runtime`, plus Python3, GCC, git, and node-gyp)

## Bill-of-Material

<!--- Do not manually modify anything below this line! --->
<!--- BOM-starts --->

### **latest-slim**

- ubuntu-22.10-kinetic
- node-18.16.0
- npm-9.6.7

### **latest-runtime**

- everything in _latest-slim_
- firefox-113.0
- playwright-1.34.3

### **latest-build**

- everything in _latest-runtime_
- git-2.37.2
- gcc-12.2.0
- python3-3.10.7
- pip-23.1.2
- node-gyp-9.3.1
<!--- BOM-ends. Document ends here too --->
