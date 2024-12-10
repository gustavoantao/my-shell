FROM ubuntu:22.04

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y curl mariadb-client postgresql-client netcat net-tools vim ansible nginx

CMD ["nginx", "-g", "daemon off;"]