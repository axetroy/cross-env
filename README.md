# cross-env

![ci](https://github.com/axetroy/cross-env/workflows/ci/badge.svg)
![Latest Version](https://img.shields.io/github/v/release/axetroy/cross-env.svg)
![License](https://img.shields.io/github/license/axetroy/cross-env.svg)
![Repo Size](https://img.shields.io/github/repo-size/axetroy/cross-env.svg)

cross-platform cli for setting environment variables written in [vlang](https://github.com/vlang/v)

## Installation

If you are using `unix` style system(`macOS`/`Linux`). enter the command line to install.

```shell
# install the latest version
curl -fsSL https://raw.githubusercontent.com/axetroy/cross-env/master/install.sh | bash
# install the specified version
curl -fsSL https://raw.githubusercontent.com/axetroy/cross-env/master/install.sh | bash -s v0.1.0
```

Or download [the release file](https://github.com/axetroy/cross-env/releases) for your platform and put it to `$PATH` folder.

## Usage

```sh
$ cross-env FOO=BAR NODE_ENV=PRODUCTION node index.js
```

## Build from source

```sh
$ make
```

## LICENSE

The [MIT License](LICENSE)
