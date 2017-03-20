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


sudo    /e/bin/singularity create --size 1300 circos.img
sudo -E /e/bin/singularity --debug bootstrap circos.img centos6_circos.def 
