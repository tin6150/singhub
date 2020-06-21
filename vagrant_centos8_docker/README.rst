
centos 8 w/ docker (regular docker, root).

installed kwin first, didn't know could run kwin to get wm.
then added kde, but vncsvr start didn't seems to launch it.  vnc log says D-Bus exited w/o error.

got 4 GB RAM and 3 CPU. so the vbox changes work.

vncsvr19 produced a narrow window ~1080 px as well.  
vncsvr4k did produce a very wide window.  there maybe some bug there setting the width...


r4eta rstudio  works (sudo docker ..., regular docker, which was expected to work.  vnc has proper graphics that zink just didn't have, time to rewrite the xorg by hand and fix the missing xRandR error (xinerama is no good).
Likely just running kwin, though full kde installed.  

but podman don't work in the centos8 or centos7 config.  probably the X11 socket stuff isn't mapped correctly.


