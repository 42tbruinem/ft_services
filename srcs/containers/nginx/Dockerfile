FROM alpine:3.12

LABEL maintainer tbruinem

RUN	apk update && \
	apk upgrade && \
	apk add openssl && \
	apk add nginx

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
    mkdir -p /run/nginx

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
#COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/nginx.cert /etc/ssl/localhost.crt
COPY srcs/nginx.key /etc/ssl/localhost.key

EXPOSE 80 443 22

CMD /usr/sbin/nginx -g "daemon off;"