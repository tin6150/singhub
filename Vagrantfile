# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "base"
  #config.vm.box = "base"
  # https://app.vagrantup.com/centos/boxes/7
  #config.vm.box = "foo7"	# mint ran agrant box add foo7 https://vagrantcloud.com/centos/boxes/7/versions/1708.01/providers/virtualbox.box 
  #config.vm.box = "centos/7"	# don't seems to take name of "foobar/7" when doing box add :(
  #config.vm.box_version = "1708.01"
  config.vm.define "cen7" do |cen7|
    #cen7.vm.box = "cen7"		# mint, cuz box add centos/7 may not be working right.  still don't work
    cen7.vm.box = "centos/7"		# mac, where automatic url retrieval works.
  end

  #config.vm.define "ubu16" do |ubu16|
  #  ubu16.vm.box = "ubuntu/xenial64"
  #end

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  #config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"

  #### the following was copied fomr the Vagrantfile generated for Mac OS X 

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
   
      # Customize the amount of memory on the VM:
      # default seems to be 512
      #vb.memory = "1024"
      vb.memory = "1530"		
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

    ## config added by Tin 2017.0917
    config.vm.provision "shell", inline: <<-SHELL
	touch /Vagrant_provision
	yum -y install vim wget curl git autoconf automake libtool tigervnc-server
	yum -y install virt-what
	yum -y group install "Server with GUI"
	#yum -y group install "KDE"
	[[ -d /opt ]] || mkdir /opt
	cd /opt
	wget -nc https://raw.githubusercontent.com/tin6150/singhub/master/install -O install
	bash install --prefix=/opt --build=2.4.beta
	KNIMEIMG=tin6150-knime-withFullExtension.img
	[[ -f $KNIMEIMG ]] || /opt/singularity-2.4.beta/bin/singularity pull shub://tin6150/knime:withFullExtension
	# seems to have java by default...
	wget https://raw.githubusercontent.com/tin6150/psg/master/conf/X11/10-monitor.conf -O 10-monitor.conf
	mv 10-monitor.conf /etc/X11/xorg.conf.d/
	# pff... can't get the resolution to work on virtualbox on macbook.
	# just use vncserver -geometry 1280x800 
	
	cd $HOME
	wget https://raw.githubusercontent.com/tin6150/psg/master/script/sh/.bashrc -O .bashrc
	mkdir /home/sn-gh 
	cd    /home/sn-gh
	git clone https://tin6150@github.com/tin6150/psg
	git clone https://tin6150@github.com/tin6150/singhub

    SHELL

end
