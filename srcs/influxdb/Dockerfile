FROM alpine:3.12

RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache influxdb

EXPOSE 8086

CMD [ "influxd", "run", "-config", "etc/influxdb.conf" ]
