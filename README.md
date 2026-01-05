# Corintho's Keymaps

[![Build QMK firmware](https://github.com/corintho/qmk_artsey/actions/workflows/build_binaries.yaml/badge.svg?branch=main)](https://github.com/corintho/qmk_artsey/actions/workflows/build_binaries.yaml)

For general instructions on how to setup see [main readme](https://github.com/qmk/qmk_userspace/blob/main/README.md).

Keep in mind that for this repository to work properly, you need to use this repo as the [firmware repo](https://github.com/corintho/qmk_firmware_artsey) during QMK setup. If you are maintainig your own firmware, be sure to copy the keyboard definition from `keyboards/artsey_io` to your own firmware setup.

## Overview
I keep my keymaps here, along with the original reference for the [beta 0.9](https://artsey.io/#beta-090)
I have a liatris board, so I also maintain a custom version for it.

## Tools
I use two tools for development, besides the required ones from QMK. Both of them are optional.

### Devenv
[Devenv](https://devenv.sh/) is used to manage the dependencies.
If you don't want to use it, just setup QMK normally.

### Just
[Just](https://just.systems/) is used to write scrits and handle tasks.
For a general overview, you can run `just`, and you should get a list of targets with a brief description.

## Building
Copy `.env.example` to `.env` and adjust the values as necessary.

If you are using the provided just scripts, `just install` will install the firmware defined in the `.env` file, to the device defined in the `.env` file. Ensuring it is locally built first.

