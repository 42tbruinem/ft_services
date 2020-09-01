FROM alpine:3.12

LABEL maintainer tbruinem

RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache curl && \
	apk add grafana --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN mkdir -p /var/lib/grafana/dashboards

COPY ./srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY ./srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources
COPY ./srcs/dashboards/* /var/lib/grafana/dashboards/
COPY ./srcs/create_user.sh /create_user.sh

RUN chmod +x /create_user.sh

WORKDIR /usr/share/grafana

EXPOSE 3000

CMD [ "grafana-server" ]
