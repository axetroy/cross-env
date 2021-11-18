# cross-env

[![ci](https://github.com/axetroy/cross-env/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/axetroy/cross-env/actions/workflows/ci.yml)
![Latest Version](https://img.shields.io/github/v/release/axetroy/cross-env.svg)
![License](https://img.shields.io/github/license/axetroy/cross-env.svg)
![Repo Size](https://img.shields.io/github/repo-size/axetroy/cross-env.svg)

cross-platform cli for setting environment variables, written in [vlang](https://github.com/vlang/v)

### Install

1. Shell (Mac/Linux)

```bash
curl -fsSL https://github.com/release-lab/install/raw/v1/install.sh | bash -s -- -r=axetroy/cross-env
```

2. PowerShell (Windows):

```powershell
$r="axetroy/cross-env";iwr https://github.com/release-lab/install/raw/v1/install.ps1 -useb | iex
```

3. [Github release page](https://github.com/axetroy/cross-env/releases) (All platforms)

download the executable file and put the executable file to `$PATH`

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
