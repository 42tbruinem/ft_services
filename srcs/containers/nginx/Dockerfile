FROM alpine:3.7

MAINTAINER tbruinem

RUN	apk update && \
	apk upgrade && \
	apk add openssl && \
	#apk add openssh && \
	#apk add supervisor && \
	apk add nginx \

RUN adduser --disabled-password -g 'Nginx www user' -h /home/www/ nginx_admin

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/nginx.cert /etc/ssl/localhost.cert
COPY srcs/nginx.key /etc/ssl/localhost.key

EXPOSE 80 443 22

CMD /usr/sbin/nginx -g "daemon off;"