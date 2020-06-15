

Vagrant
*******


limited info on how i setup VM using vagrant using files in this dir.
more info at:
https://tin6150.github.io/psg/vagrant.html


Setting up new VM using Vagrant.
Boot strap OS, 
then most of the setup would be by Ansible, 
using stuff that was done for desktop setup (eg wsl_... under cueball)


::

	# cp -p Vagrantfile.centos8 Vagrantfile
	export VAGRANT_FILE=Vagrantfile.centos8 
	vagrant up
	vagrant status

	vagrant ssh


	VAGRANT_FILE=Vagrantfile.centos7 vagrant ssh  
	does NOT get into the VM defined by the alternate definition.
	May have to create multiple directory for each.
	Which means linking the ansible playbook, or skipping them :/
	it may have to do with vagrant init...

