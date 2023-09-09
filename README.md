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

- ubuntu-23.04-lunar
- node-20.5.1
- npm-10.1.0

### **latest-runtime**

- everything in _latest-slim_
- firefox-115.0
- playwright-1.37.1

### **latest-build**

- everything in _latest-runtime_
- git-2.39.2
- gcc-12.3.0
- python3-3.11.4
- pip-23.0.1
- node-gyp-9.4.0
<!--- BOM-ends. Document ends here too --->
