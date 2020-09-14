FROM alpine:3.12

LABEL maintainer tbruinem

RUN	apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache nginx \
	jq \
	curl \
	gettext \
	openssh \
	supervisor

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
    mkdir -p /var/run/nginx

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/index.html /tmp/index.html
COPY srcs/nginx.cert /etc/ssl/services.crt
COPY srcs/nginx.key /etc/ssl/services.key
COPY srcs/supervisord.conf /etc/
COPY srcs/setup.sh /tmp/
COPY srcs/liveness.sh /tmp/
COPY srcs/get_external-ip-address.sh /tmp/

RUN ssh-keygen -A
RUN chmod +x /tmp/*.sh

EXPOSE 80 443 22

CMD ["sh", "-c", "/tmp/setup.sh ; /usr/bin/supervisord -c /etc/supervisord.conf"]
