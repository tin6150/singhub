

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


CentOS 8 (podman) ::

	mkdir vagrant_centos8
	# cp -p Vagrantfile.centos8 Vagrantfile
	vagrant up
	vagrant status
	# the 2nd provision section in the Vagrantfile calls ansible
	# thus need to link the ansible playbook and the role that provision VBox toolbox
	# the ansible play isnt well developed for rhel8 at this point
	# centos7 no longer executing the virtualbox-guest role correctly, complain about stat, is it loosing vars?
	ln -s ../ansible/vagrantfile_playbook.yml .
	ln -s ../ansible/role/virtualbox-guest    .
	vagrant provision
	vagrant ssh


CentOS 8 w/ Docker ::

	# PLAN fat image w/ cueball ansible playbook , but problem with tags :/  2020.0715

	mkdir vagrant_centos8_docker
	mkdir vagrant_centos8_docker/VAGRANT_DATA # shared dir b/w VM and host
	# simplified and updated Vagrantfile
	vagrant up
	vagrant ssh
	# full docker-ce, not the rootless thing.  
	# see Vagrantfile shell provision section for commands

	# adding space by Vagrantfile: vb.vm.disk :disk, size: "30GB", primary: true
	vagrant plugin install vagrant-disksize
	# xx VAGRANT_EXPERIMENTAL="disks"
	vagrant reload
	# config.disksize.size = "50GB" worked, but extended sda, need to resize partition before  xfs_growfs /

FreeBSD 11 ::

	cd vagrant_freeBSD
	# fuzzy, this should just seed a initial Vagrantfile with desired source for VBox image...  maybe it was box hostname something that needed an init bootstrap creation before it can be "renamed"
	vagrant init freebsd/FreeBSD-11.4-RELEASE  --box-version 2020.06.12
	vagrant up
	vagrant halt
	vi Vagrantfile 
	vagrant up
