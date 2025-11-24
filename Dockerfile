# https://github.com/dooman87/imagemagick-docker/blob/main/Dockerfile.bullseye
# https://hub.docker.com/layers/dpokidov/imagemagick/7.1.1-47-bullseye/images/sha256-232be72bcc3e186c537653508e4e8b2f87cb613ecc888d94d68bf47257d89a1b
# keep same imagemagick version here and in .sh file
FROM dpokidov/imagemagick:7.1.1-47-bullseye

COPY heic2jpg.sh /heic2jpg/

# https://pkgs.alpinelinux.org/package/edge/community/x86/imagemagick
RUN chmod +x /heic2jpg/heic2jpg.sh && \
    mkdir -p /workdir

WORKDIR /workdir/
ENTRYPOINT [ "/heic2jpg/heic2jpg.sh" ]

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
