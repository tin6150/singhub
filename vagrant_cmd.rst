
sudo apt-get install vagrant virtualbox

vagrant init 
vi Vagrantfile
vagrant up


#vagrant box add cen7 https://app.vagrantup.com/centos/boxes/7  ?? didn't work

vagrant suspend			# hibernate vm
vagrant halt			# power off vm

vagrant box list

#--vagrant destroy		# this will DELETE the box and ...




/usr/bin/vboxmanage 
vboxmanage list vms
vboxmanage showvminfo

