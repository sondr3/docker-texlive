# Docker image for texlive [![TexLive:2019](https://img.shields.io/badge/TeX%20Live-2019-blue.svg)](https://www.tug.org/texlive/acquire.html) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is a "minimal" Docker image for TeXLive 2019 containing only the latest
TeXLive. But fair warning, this is only meant for my personal usage, use at
your own risk.

## Usage

### Using `podman`

`podman run --rm -it -v $(pwd):/home sondr3/texlive latexmk document.tex`

### Using `docker`

`docker run --rm -it -v $(pwd):/home sondr3/texlive latexmk document.tex`

## License

- The files in this repository are licensed under [MIT](https://spdx.org/licenses/MIT.html).
- Each LaTeX package has its own license.
  Please check the respective package homepages at [CTAN](https://www.ctan.org/).
