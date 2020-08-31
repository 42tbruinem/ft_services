FROM alpine:3.12

LABEL maintainer tbruinem

RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add grafana --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN sed -i "/admin_user = /c\admin_user = \$GF_SECURITY_ADMIN_USER" /usr/share/grafana/conf/defaults.ini && \
	sed -i "/admin_password = /c\admin_password = \$GF_SECURITY_ADMIN_PASSWORD" /usr/share/grafana/conf/defaults.ini

WORKDIR /usr/share/grafana

EXPOSE 3000

CMD [ "grafana-server", "web" ] 
