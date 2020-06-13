singhub
*******

| Singing hub, a concert in the making :)



This repo used a mix pot of things.
**But now it is being used really to setup VM via vagrant**
overall, see README.vagrant.rst and https://tin6150.github.io/psg/vagrant.html



- some random vagrant and ansible stuff that started life here as was using them in conjunction of some project being worked on.  These have been slowly migrating to their own repo, but some snipplet of code may still be found only in here.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                                         ~ 8 ~
                             **rest probably osbolete**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


- Sinuglarity 3 install notes in CF_BK/sw/
- container I build have a dedicated dir for each container now, as Singularity Hub for a while expected a repo with a static 'Singularity' file there, didn't even accept a .def :/
  I am also doing Dockerfile that invoke shell script to do install, the Singularity is mostly just a wrapper.




- singularity hub container definition, for things that I am developing, which may or may not be uploaded to singularity-hub.org by V.  If they do, a dedicated git repo will be created for them since that's how singularity-hub need them (eg circos, topspin)

- install: a single script to download and install latest singularity.  submitted PR.  But turns out V already had a similar script, so will use that instead.


- various script I use to install singularity and download my favorite containers.



PS

- environment modules def for singularity are placed in 
  /home/tin/tin-gh/psg/modulefiles/container/singularity



--------------------------
scratch notes while in dev
--------------------------

Using V's script to install singularity (2.4.1)

sudo chgrp tin /opt
sudo chmod g+w /opt
cd /opt
git clone https://github.com/singularityware/singularity-builder

VER=2.4.2
sudo /opt/singularity-builder/singularity_build.sh  all --prefix /opt/singularity-${VER}


# create new env module in /home/tin/tin-gh/psg/modulefiles/container/singularity

module load container/singularity/${VER}
singularity selftest


mkdir /opt/sing-shub 
cd    /opt/sing-shub 

singularity pull ...chrome

singularity pull shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome


~~~~

Getting dev version of singularity (2.3) installed

git clone https://github.com/singularityware/singularity
cd singularity 

git checkout development
./autogen.sh

sudo mkdir -p /export/singularity/2.3
sudo ln -s /export/singularity/2.3 /e


./configure --prefix=/e
make
sudo make install

cp /etc/motd /tmp
echo "singularity 2.3 installed in /e" >> /tmp/motd
sudo cp /tmp/motd /etc


~~~~

Creating containers  2.4.2 days

sudo    /opt/singularity-2.4.2/bin/singularity build -w ./sl6_lbl.simg ./sl6_lbl.def

# nah, globus it, so i don't have to constantly login --nope, wrong FS
scp sl6_lbl.simg tin@lrc-xfer:/global/scratch/tin/singularity-repo/

singularity shell -B /global/software/sl-6.x86_64/ sl6_lbl.simg

~~~~

Creating containers  2.2 days

sudo    /e/bin/singularity create --size 3200 topspin.img
sudo -E /e/bin/singularity bootstrap topspin.img centos7_topspin.def 


sudo    /e/bin/singularity create --size 1700 circos.img
sudo -E /e/bin/singularity bootstrap circos.img centos6_circos.def | tee sing.log 2>&1
#sudo -E /e/bin/singularity bootstrap --debug circos.img centos6_circos.def 


~~~~

Chromium browser using singularity 2.2.1 - cueball
cd /opt/singularity-2.2.1/img

## 1500 wasn't enough! (though dup download in /opt)  it need stuff like gconf-service
## expand --size 100 ## will add 100 MB to existing image, it is not spec for final size
sudo /opt/singularity-2.2.1/bin/singularity create  --size 1600 chromium.img
sudo /opt/singularity-2.2.1/bin/singularity bootstrap           chromium.img ubuntu_chrome.def | tee sing.log 2>&1



~~~~

Knime, but better off see shub version

singularity=/prog/singularity/2.3/bin/singularity
sudo    $singularity create --size 2500 knime.img
sudo -E $singularity bootstrap knime.img ubuntu_knime.def | tee knime.log 2>&1 

~~~~

Dell racadm 
can't build on lrc-sl7, need root.
try cueball, but that's ubuntu base...    aptitude install yum.  still problem.  try vagrant vm...

Singularity=/opt/singularity-2.3.1/bin/singularity
Singularity=/prog/singularity/2.3/bin/singularity       # c7
sudo $Singularity create --size 1900 racadm.img
sudo $Singularity bootstrap racadm.img  centos7_racadm.def | tee racadm.log 2>&1 




--------------------------
tmp misc
--------------------------

for hysterical reason, vagrant and/or some ansible stuff is in this dir
(cuz was trying to make VM using vagrant to build and test singularity container while on a mac)

these files may move in the future...
or more elaborate version build elsewhere and this dir remains a playground

xref: https://github.com/tin6150/inet-dev-class/tree/master/ansible


copied PeterMosmans/virtualbox-guest/ to this dir
and modified it to work in centos.
(actually, did he make update yet? should have checked before writting all the extra code!)

anyway, seems to work, need to test on another machine.
startx doesn't work on the VM yet, some complain about MESA...

2017.1104


Okay, Ansible playground has been moved to 
CF_BK/cueball/ANSIBLE

with cheatsheet notes at
https://github.com/tin6150/inet-dev-class/tree/master/ansible


This dir may still get some work done on Vagrant and the ansible portion vagrant use
(mostly the virtualbox guest addition package).
Not all the ansible YAML code has been migrated yet, but 
increasinglly expect the cueball (or bofh) repo to become the one ansible that rule them all :)

2017.1110



