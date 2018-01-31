FROM daocloud.io/library/ubuntu:14.04

MAINTAINER xiaokaixuan xiaokaixuan@mail.com

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
RUN mv /etc/apt/sources.list /etc/apt/sources.list.old
COPY sources.list /etc/apt/

RUN apt-get update && apt-get install --no-install-recommends -y lib32z1 lib32ncurses5 lib32bz2-1.0 2>/dev/null && apt-get clean

RUN mkdir /root/disk /mnt/disk

WORKDIR /root

ADD Xware Xware
RUN chmod a+x /root/Xware/*

ENTRYPOINT ["/root/Xware/start"]
