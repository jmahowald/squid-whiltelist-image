FROM alpine:3.6

RUN apk add --update --no-cache  \
   squid wget openssl ca-certificates tini

ENV DOCKERIZE_VERSION v0.6.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

EXPOSE 8080

COPY allowedurls.tpl /etc/squid/allowedurls.tpl
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /etc/squid/entrypoint.sh

RUN chmod 755 /etc/squid/entrypoint.sh

ENV DOMAINS .amazonaws.com
ENTRYPOINT [ "/sbin/tini", "--", "/etc/squid/entrypoint.sh" ]
CMD ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]