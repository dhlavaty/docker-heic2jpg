# heic2jpg Docker Image

## Description

Small docker image with ImageMagick and heic2jpg script based on Alpine linux.

Simplest a convenient way how to convert your HEIC images to JPG.

## Usage

For `heic2jpg` to convert all `*.heic` files to `*.jpg` run:

```sh
docker run --rm -v "${PWD}:/workdir" dhlavaty/heic2jpg
```

## Convenient usage using shell alias

Use `heic2jpghere` alias (in your `zsh.rc` for example):

```sh
alias heic2jpghere='docker run --rm -v "${PWD}:/workdir" dhlavaty/heic2jpg'
```

And now to convert all HEIC files in your current directory:

```sh
$ cd /Users/my/iphone/images
$ heic2jpghere

# done
```

## Docker build

Build image:

```sh
$ docker build . --tag dhlavaty/heic2jpg
```

Lint dockerfile:

```sh
$ docker run --rm -i hadolint/hadolint < Dockerfile
```

## License

This project is licensed under MIT - http://opensource.org/licenses/MIT
