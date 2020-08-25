FROM alpine:3.12

LABEL maintainer tbruinem

RUN	apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache nginx

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
    mkdir -p /var/run/nginx

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/index.html /www/index.html
COPY srcs/nginx.cert /etc/ssl/services.crt
COPY srcs/nginx.key /etc/ssl/services.key

EXPOSE 80 443 22

CMD nginx -g "daemon off;"
