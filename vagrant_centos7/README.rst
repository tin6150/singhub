

on Zink, it got kde, xfce installed.  centos 7.8

vnc size/resolution:
	alias vncsvr16='vncserver -geometry 1540x760 -depth 24'    #  1600x900  m42
there were some bug with Xvnc with the geometry on x axis.  ~1900 also only give ~1080.
vncsvr24 worked to provide a wider screen.

though 1080 width worked well on the rotated thinkvision screen.

vncserver starts kde automatically.  use a black konsole, which is easier to read the shell colored text than a white xterm of xfce.

but don't like konsole, but could run xfce-terminal :)
may need more cpu and ram for the vm.  
1 cpu, 2.3 GB is quite slow.

and something is messing with term mouse copy-paste :/
likely the messed up vnc session?  things are fine now.  no reboot of host, though vm rebooted.
it was cuz podman tried to run rstudio and fiddleled the X11 socket and failing and messed things up.
vncserver -kill for that restored mouse copy-paste sanity.

~~~~

podman installed.
had to 
echo 1000 | sudo tee /proc/sys/user/max_user_namespaces
to enable userns (this is the config that centos7 have userns included but disabled by default).
https://superuser.com/questions/1294215/is-it-safe-to-enable-user-namespaces-in-centos-7-4-and-how-to-do-it

trying:
podman run  -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix                                   -v $HOME:/tmp/home  --entrypoint rstudio tin6150/r4eta

dont work.  not even when sudo.
podman has some problem with the X11 socket or D-Bus or something?
dont think it is Qt not right on this box, as centos8dog essentially just got kwin and kde on it, same as here.





virtual box, vm download of docker image seems rather slow.

