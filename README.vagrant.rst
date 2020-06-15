

Vagrant
*******


limited info on how i setup VM using vagrant using files in this dir.
more info at:
https://tin6150.github.io/psg/vagrant.html

	Vagrant env vars:
	https://www.vagrantup.com/docs/other/environmental-variables.html


Setting up new VM using Vagrant.
Boot strap OS, 
then most of the setup would be by Ansible, 
using stuff that was done for desktop setup (eg wsl_... under cueball)


Creeat a directory for each vagrant instance/vm, 
so that each has its Vagrantfile and .vagrant dir hosting the config.


CentOS 8 ::

	mkdir vagrant_centos8
	# cp -p Vagrantfile.centos8 Vagrantfile
	vagrant up
	vagrant status
	vagrant ssh


FreeBSD 11 ::

	cd vagrant_freeBSD
	VAGRANT_VAGRANTFILE=Vagrantfile.freeBsd11  vagrant up
