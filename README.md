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

### **latest-slim**

- alpine-3.17.2
- nodejs-18.12.1
- npm-9.1.2

### **latest-runtime**

- everything in _latest-slim_
- chromium-109.0.5414.74

### **latest-build**

- everything in _latest-runtime_
- gcc-12.2.1_git20220924
- git-2.38.3
- python3-3.10.10
- pip-22.3.1
- node-gyp-9.3.1
<!--- BOM-ends. Document ends here too --->
