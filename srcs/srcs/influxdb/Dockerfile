FROM alpine:3.12

LABEL maintainer tbruinem

ENV INFLUXDB_CONFIG_PATH /etc/influxdb.conf

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
	apk add --no-cache influxdb

EXPOSE 8086

CMD influxd
