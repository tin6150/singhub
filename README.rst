singhub
-------

singularity hub container definition


--------------------------
scratch notes while in dev
--------------------------



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

Creating containers

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




