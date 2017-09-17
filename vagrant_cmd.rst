
Mint:    sudo apt-get install vagrant virtualbox

Centos7: yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm
# https://www.tecmint.com/how-to-install-vagrant-on-centos-7/ says vagrant can use docker too...
# but not so sure.  vagrant ask for VirtualBox, VMware, hyperV.  

# yum -y install virt-what              # inside VM, tell/guess what env is in.

vagrant init 
vi Vagrantfile
vagrant up

# works on osx sierra, but not on mint rafaela, which needed:
vagrant box add centos/7 https://vagrantcloud.com/centos/boxes/7/versions/1708.01/providers/virtualbox.box   ## this one works!
# see https://github.com/hashicorp/vagrant/issues/5016
# but in mint, still can't do vagrant up, something crashes , but that maybe virtualbox bug... oh, my linux box had been acting up...

vagrant suspend			# hibernate vm
vagrant halt			# power off vm

vagrant box list -i		# -i give extra info.  but container name with /n doesn't show up!  bug??
vagrant box remove -h 		# -h for help on specific subcommand
vagrant box remove foobar/7 virtualbox

#--vagrant destroy		# this will DELETE the box and ...




/usr/bin/vboxmanage 
vboxmanage list vms
vboxmanage showvminfo

