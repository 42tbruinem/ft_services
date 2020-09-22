adduser -D -h /var/ftp $FTPS_USER && \
echo "$FTPS_USER:$FTPS_PASS" | chpasswd

export PASV_ADDR=""
while [ -z "$PASV_ADDR" ]
do
	. /tmp/get_external-ip-address.sh PASV_ADDR ftps-svc
	sleep 1
done

envsubst '${PASV_ADDR} ${MYSQL_DB_HOST}' < /tmp/vsftpd.conf > etc/vsftpd/vsftpd.conf

vsftpd /etc/vsftpd/vsftpd.conf