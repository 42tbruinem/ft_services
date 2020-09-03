adduser -D -h /var/ftp $FTPS_USER && \
echo "$FTPS_USER:$FTPS_PASS" | chpasswd

. /tmp/get_external-ip-address.sh PASV_ADDR ftps-svc
envsubst '${PASV_ADDR} ${MYSQL_DB_HOST}' < /tmp/vsftpd.conf > etc/vsftpd/vsftpd.conf

vsftpd /etc/vsftpd/vsftpd.conf