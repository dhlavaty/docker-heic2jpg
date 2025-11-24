FROM alpine:3.22.2

COPY heic2jpg.sh /heic2jpg/

# https://pkgs.alpinelinux.org/package/edge/community/x86/imagemagick
# keep same imagemagick version here and in .sh file
RUN apk add imagemagick=7.1.2.8-r0 imagemagick-heic=7.1.2.8-r0 --no-cache && \
    rm -rf /var/cache/apk/* && \
    chmod +x /heic2jpg/heic2jpg.sh && \
    mkdir -p /workdir

WORKDIR /workdir/
ENTRYPOINT [ "/heic2jpg/heic2jpg.sh" ]

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
