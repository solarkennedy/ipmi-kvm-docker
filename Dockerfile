FROM ubuntu:14.04
MAINTAINER Kyle Anderson <kyle@xkyle.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:forkotov02/firefox-gtk2-trusty
RUN apt-get update && apt-get -y install xvfb x11vnc wget \
    supervisor fluxbox icedtea-7-plugin net-tools \
    python-numpy firefox-esr=52.9.0esr-2~ppa1
RUN sed -e '/^jdk.jar.disabledAlgorithms/s/^/#/' -i /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security 
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /root/
ADD novnc /root/novnc/

ENV DISPLAY :0
EXPOSE 8080
CMD ["/usr/bin/supervisord"]
