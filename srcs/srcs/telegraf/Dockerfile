FROM alpine:3.12

LABEL maintainer tbruinem

RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

ENTRYPOINT [ "telegraf" ]
