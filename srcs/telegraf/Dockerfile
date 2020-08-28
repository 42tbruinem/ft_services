FROM alpine:3.12

RUN mkdir /etc/telegraf && \
    wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz && \
    tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz && \
    chmod +x telegraf/* && \
	apk add --no-cache gettext && \
    cp telegraf/telegraf /usr/bin/ && \
    rm -rf *.tar.gz* telegraf/ && \
    rm -rf /var/cache/apk/*

COPY telegraf.conf /tmp/telegraf.conf
RUN envsubst '${INFLUX_SKIP_DATABASE_CREATION}' < /tmp/telegraf.conf > /etc/telegraf/telegraf.conf

EXPOSE 4999

CMD sh

#ENTRYPOINT [ "/usr/bin/telegraf" ]
