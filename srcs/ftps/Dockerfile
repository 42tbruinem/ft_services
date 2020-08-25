FROM alpine:3.12

LABEL maintainer tbruinem

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache vsftpd

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/ftps.cert /etc/ssl/certs/ftps.cert
COPY ./srcs/ftps.key /etc/ssl/certs/ftps.key

RUN	adduser -D -h /var/ftp ftps_user && \
	echo "ftps_user:pass" | chpasswd

#20 = command control
#21 = data transfer
#30000-31000 = passive ftp mode

EXPOSE 21 20 30000

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
