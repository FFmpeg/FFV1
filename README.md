# FFV1 Specification

## Introduction

This repository manages the development of specification documents for FFV1, a lossless intra-frame video codec. The goals of this specification effort are defined within the charter of the [cellar working group](https://datatracker.ietf.org/wg/cellar/charter/) of the [Internet Engineering Task Force](https://ietf.org/). Information within this repository should be considered in draft form. The most recent official version of the specification for FFV1 versions 0, 1 and 3 may be found at https://datatracker.ietf.org/doc/draft-ietf-cellar-ffv1/ and for FFV1 version 4 at https://datatracker.ietf.org/doc/draft-ietf-cellar-ffv1-v4/. An HTML rendering is also available via https://ffmpeg.org/~michael/ffv1.html.

## Formatting

The FFV1 specification was initially written in lyx. In July 2015 the formatting of the specification was transitioned to Markdown. Propering PDF and HTML rendering has been tested with requires pandoc version 1.13.2.1 and higher.

The Markdown version of the FFV1 specification may also be converted into XML, HTML, and text formats as an IETF RFC draft based on [xml2rfc version 3](https://tools.ietf.org/html/rfc7991). Producing the RFC formats requires mmark version 2.0.40 or higher and xml2rfc version 2.23.1 or higher.

A Makefile is provided that can produce the PDF and RFC outputs.

## Version Handling

The ffv1.md file is currently intended to be used to produce documentation for both FFV1 versions 0, 1, and 3 as well as FFV1 version 4. Lines containing `{V4}` will be suppressed from the version 0,1,3 outputs while lines containing `{V3}` will be suppressed from the version 4 outputs.

## Code of Conduct

Please note that this project is developed under the [FFmpeg Code of Conduct](https://www.ffmpeg.org/developer.html#Code-of-conduct). By participating in this project you agree to abide by its terms.
