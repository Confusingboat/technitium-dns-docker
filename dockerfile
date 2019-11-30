FROM mcr.microsoft.com/dotnet/core/runtime:2.2-alpine

ENV TZ='America/Chicago'

ADD https://download.technitium.com/dns/DnsServerPortable.tar.gz /

RUN apk update && apk upgrade && \
  apk add --no-cache tzdata && \
  mkdir -p /etc/dns/ && \
  tar -zxf DnsServerPortable.tar.gz -C /etc/dns/ && \
  rm /DnsServerPortable.tar.gz

WORKDIR /etc/dns
ENTRYPOINT ["sh", "./start.sh"]
