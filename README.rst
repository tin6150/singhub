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

singularity=/prog/singularity/2.3/bin/singularity
sudo    $singularity create --size 2000 knime.img
sudo -E $singularity bootstrap knime.img ubuntu_knime.def | tee knime.log 2>&1 
