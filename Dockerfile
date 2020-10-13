FROM ubuntu:14.04
MAINTAINER Kyle Anderson <kyle@xkyle.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install xvfb x11vnc wget supervisor fluxbox \
    firefox icedtea-7-plugin net-tools python-numpy
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /root/
ADD novnc /root/novnc/

ENV DISPLAY :0
EXPOSE 8080
CMD ["/usr/bin/supervisord"]
