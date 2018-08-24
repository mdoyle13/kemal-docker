FROM durosoft/crystal-alpine:0.26.0 as builder
RUN mkdir /src
WORKDIR /src
RUN apk --update add openssl-dev
COPY . /src/
RUN shards && crystal build --release src/service.cr
RUN apk add --update openssl pcre gc libevent libgcc
EXPOSE 3000
COPY ./entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT [ "/src/service"]