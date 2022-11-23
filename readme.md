# heic2jpg Docker Image

## Description

Small docker image with ImageMagick and heic2jpg script based on Alpine linux.

Simplest a convenient way how to convert your HEIC images to JPG.

## Usage

For `heic2jpg` to convert all `*.heic` files to `*.jpg` run:

```sh
docker run --rm -v "${PWD}:/workdir" dhlavaty/heic2jpg
```

You can use parameter `--ignore-existing` to ignore already converted files:

```sh
docker run --rm -v "${PWD}:/workdir" dhlavaty/heic2jpg -- --ignore-existing
```

## Convenient usage using shell alias

Use `heic2jpghere` alias (in your `zsh.rc` for example):

```sh
alias heic2jpghere='docker run --rm -v "${PWD}:/workdir" dhlavaty/heic2jpg --'
```

And now to convert all HEIC files in your current directory:

```sh
$ cd /Users/my/iphone/images
$ heic2jpghere

# done
```

or

```sh
$ cd /Users/my/iphone/images
$ heic2jpghere --ignore-existing

# done
```

## Docker build

Build multi-arch image:

```sh
$ docker buildx create --name mybuilder
$ docker buildx use mybuilder

# (Optional) check your builder
$ docker buildx inspect

$ docker buildx build --platform linux/amd64,linux/arm64 --tag dhlavaty/heic2jpg . --push

# (Optional) Inspect your image
$ docker buildx imagetools inspect dhlavaty/heic2jpg
```

Lint dockerfile:

```sh
$ docker run --rm -i hadolint/hadolint < Dockerfile
```

## License

This project is licensed under MIT - http://opensource.org/licenses/MIT
