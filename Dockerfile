FROM alpine:3.13.5

COPY heic2jpg.sh /heic2jpg/

RUN apk add imagemagick=7.0.11.14-r0 --no-cache && \
    rm -rf /var/cache/apk/* && \
    chmod +x /heic2jpg/heic2jpg.sh && \
    mkdir -p /workdir

WORKDIR /workdir/
ENTRYPOINT [ "/heic2jpg/heic2jpg.sh" ]

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
