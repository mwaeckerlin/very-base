# Minimum Alpine Docker Image with Definitions and Non Root User

Minimal docker base image built on alpine. Use this image as base in your build stestageps, then add an additional stage for production, where you inherot from [mwaeckerlin/scratch](https://github.com/mwaeckerlin/scratch).

Image size: 5.59MB

See [mwaeckerlin/nginx](https://github.com/mwaeckerlin/nginx) as an example on how to build a service using this image.

Use [mwaeckerlin/nodejs-build](https://github.com/mwaeckerlin/nodejs-build) as build image for Node.JS applications.

See [mwaeckerlin/nodejs-build](https://github.com/mwaeckerlin/nodejs-build) as production ready run time base image for your Node.JS applications.