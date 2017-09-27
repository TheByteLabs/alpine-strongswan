FROM alpine:3.6
MAINTAINER David A Howard <david.a.howard@ieee.org>
ADD src /
RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.6/main > /etc/apk/repositories;\
    echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories;\
    apk add --update iptables strongswan;\
    rm -rf /var/cache/apk/*
CMD ["/start.sh"]