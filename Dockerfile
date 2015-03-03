FROM ubuntu:14.04
MAINTAINER Kyle Anderson <kyle@xkyle.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install xvfb x11vnc wget supervisor fluxbox firefox

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \ 
    apt-get update && apt-get -y install oracle-java7-installer
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /root/
ADD novnc /root/novnc/

ENV DISPLAY :0
EXPOSE 8080
CMD ["/usr/bin/supervisord"]
