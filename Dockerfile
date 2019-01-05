FROM debian:stretch-slim
MAINTAINER disson@yandex.ru
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update &&  apt-get -q -y install git curl build-essential libssl-dev zlib1g-dev \
    && git clone https://github.com/TelegramMessenger/MTProxy.git \
    && cd MTProxy && make && cp objs/bin/mtproto-proxy /usr/sbin/ \
    && chmod +x /usr/sbin/mtproto-proxy 
COPY entry.sh /entry.sh
EXPOSE 4443/tcp
ENTRYPOINT ["/entry.sh"]
