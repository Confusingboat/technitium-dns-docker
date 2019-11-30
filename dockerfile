FROM alpine:3.10

ENV TZ='America/Chicago'

COPY https://download.technitium.com/dns/DnsServerPortable.tar.gz /

RUN apk update && apk upgrade && \
  apk add --no-cache tzdata && \
  mkdir -p /etc/dns/ && \
  tar -zxf DnsServerPortable.tar.gz -C /etc/dns/

WORKDIR /etc/dns
ENTRYPOINT ["start.sh"]
