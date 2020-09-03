FROM alpine:3.12

LABEL maintainer tbruinem

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache vsftpd \
	jq \
	gettext \
	curl

COPY ./srcs/setup.sh /tmp/
COPY ./srcs/get_external-ip-address.sh /tmp/
COPY ./srcs/vsftpd.conf /tmp/vsftpd.conf
COPY ./srcs/ftps.cert /etc/ssl/certs/ftps.cert
COPY ./srcs/ftps.key /etc/ssl/certs/ftps.key

RUN	mkdir -p /var/ftp

RUN chmod +x /tmp/get_external-ip-address.sh
RUN chmod +x /tmp/setup.sh

#20 = command control
#21 = data transfer
#30000 = passive ftp mode
EXPOSE 21 20 30000

CMD /tmp/setup.sh
