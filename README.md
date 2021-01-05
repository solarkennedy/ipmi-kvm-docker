![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/lmacka/ipmi-kvm-docker)

## ipmi-kvm-docker

*Forked from solarkennedy's original and changed to include firefox-esr 52 
from a different PPA. The original now uses Chromium which doesn't work 
with some older cards, such as the HP ILO100 and IBM IMM2.*

***

Ever wanted to access and IPMI KVM console, only to find that you don't
have network access or the right version of java or a compatible 
browser or credentials?

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* Firefox - For browsing IPMI consoles
* Java-plugin - Because... you need java to access most IPMI KVM Consoles.


## Run It

    # on a remote host that can reach ipmi
    ssh admin
    $ docker run -p 8080:8080 lmacka/ipmi-kvm-docker
    
    # Now on your laptop
    xdg-open http://localhost:8080

In your web browser you should see the firefox, ready to connect to 
and IPMI KVM:

![IPMI Screenshot](https://raw.githubusercontent.com/lmacka/ipmi-kvm-docker/master/screenshot.png)
