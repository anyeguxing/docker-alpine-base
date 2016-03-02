# Alpine base

[![Image Layers](https://badge.imagelayers.io/ekapusta/alpine-base:latest.svg)](https://imagelayers.io/?images=ekapusta/alpine-base:latest) [![Docker Stars](https://img.shields.io/docker/stars/ekapusta/alpine-base.svg?style=flat-square)](https://hub.docker.com/r/ekapusta/alpine-base/) [![Docker Pulls](https://img.shields.io/docker/pulls/ekapusta/alpine-base.svg?style=flat-square)](https://hub.docker.com/r/ekapusta/alpine-base/)

## Tools

`VOL-save` will backup directory inside container.

`VOL-restore` will restore container from container (usually into VOLUME).

## Dirs

### /dcr/cm.d

For customizing CMD command by adding init hooks before default.

Convention:

* `010-$INIT-050-init` some init's init command
* `010-$INIT-200-finish` some init's finish command
* Default serice's priority is 100, pre-default is 050 and after-default is 200
* `100-$SERVICE-100-default` is default service's start command
* `100-$SERVICE-050-init` could be some before-start initialization commands for service

### /dcr/vol

For backing up and restore only changed dirs, that used as a VOLUMEs.

For example during some package install it will create `/etc/bla`, which you then will add as a VOLUME. But on run this mounted from host volume could be empty and could have not all files, that it should be.

So here are those `010-volumes-*` hooks will come to stage.

## Build

    docker build --tag=ekapusta/alpine-base .

## Debug

    docker run --rm --interactive --tty ekapusta/alpine-base sh
