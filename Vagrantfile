# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "s1" do |s1|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    s1.vm.box = "bento/centos-7.2"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"
    s1.vm.network "public_network", ip: "192.168.7.100", bridge: 'en0: Wi-Fi01 (AirPort)'

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    s1.vm.synced_folder "./data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    # config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    #   vb.memory = "1024"
    # end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
    # such as FTP and Heroku are also available. See the documentation at
    # https://docs.vagrantup.com/v2/push/atlas.html for more information.
    # config.push.define "atlas" do |push|
    #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
    # end

    s1.ssh.insert_key = false

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    s1.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y epel-release
      sudo yum upgrade -y
      sudo yum install -y strongswan
      sudo yum install -y nmap tcpdump iperf
    SHELL

    s1.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "site.yml"
    end
  end

  config.vm.define "s2" do |s2|
    s2.vm.box = "bento/centos-7.2"
    s2.vm.network "public_network", ip: "192.168.7.101", bridge: 'en0: Wi-Fi01 (AirPort)'
    s2.vm.synced_folder "./data", "/vagrant_data"
    s2.ssh.insert_key = false
    s2.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y epel-release
      sudo yum upgrade -y
      sudo yum install -y strongswan
      sudo yum install -y nmap tcpdump iperf
    SHELL

    s2.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "site.yml"
    end
  end

 #config.vm.define "s3" do |s3|
 #  s3.vm.box = "bento/centos-7.2"
 #  s3.vm.network "public_network", ip: "192.168.7.102", bridge: 'en0: Wi-Fi01 (AirPort)'
 #  s3.vm.synced_folder "./data", "/vagrant_data"
 #  s3.ssh.insert_key = false
 #  s3.vm.provision "shell", inline: <<-SHELL
 #    sudo yum install -y epel-release
 #    sudo yum upgrade -y
 #    sudo yum install -y strongswan
 #    sudo yum install -y nmap tcpdump iperf
 #  SHELL

 #  s3.vm.provision "ansible" do |ansible|
 #    ansible.verbose = "v"
 #    ansible.playbook = "site.yml"
 #  end

 #end

 #config.vm.define "s4" do |s4|
 #  s4.vm.box = "bento/centos-7.2"
 #  s4.vm.network "public_network", ip: "192.168.7.103", bridge: 'en0: Wi-Fi01 (AirPort)'
 #  s4.vm.synced_folder "./data", "/vagrant_data"
 #  s4.ssh.insert_key = false
 #  s4.vm.provision "shell", inline: <<-SHELL
 #    sudo yum install -y epel-release
 #    sudo yum upgrade -y
 #    sudo yum install -y strongswan
 #    sudo yum install -y nmap tcpdump iperf
 #  SHELL

 #  s4.vm.provision "ansible" do |ansible|
 #    ansible.verbose = "v"
 #    ansible.playbook = "site.yml"
 #  end
 #end

end
