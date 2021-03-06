# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/6"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  if not ENV['MY_PROJECTS_DIR'].nil? and not ENV['MY_PROJECTS_DIR'].empty?
    config.vm.synced_folder ENV['MY_PROJECTS_DIR'], "/home/vagrant/projects", type: "virtualbox"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = "2"
  end

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = ENV['http_proxy']
    config.proxy.https    = ENV['https_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
    puts "vagrant-proxyconf detected and proxy settings configured"
  else
    puts "WARNING: vagrant-proxyconf plugin not detected so your proxy settings will not transfer.  This may halt VM provisioning since connectivity to external resources is typically required."
  end

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "site.yml"
  # end
  config.vm.provision "file", source: "~/projects/camelspeed/vagrant-vms/files/apache-maven-3.5.4-bin.tar.gz", destination: "$HOME/apache-maven-3.5.4-bin.tar.gz"
  config.vm.provision "file", source: "~/projects/camelspeed/vagrant-vms/files/.bash_profile", destination: "$HOME/.bash_profile"
  config.vm.provision "file", source: "~/projects/camelspeed/vagrant-vms/files/.bashrc", destination: "$HOME/.bashrc"
  config.vm.provision "file", source: "~/projects/camelspeed/vagrant-vms/files/git-completion.bash", destination: "$HOME/git-completion.bash"
  config.vm.provision "file", source: "~/projects/camelspeed/vagrant-vms/files/git-prompt.sh", destination: "$HOME/git-prompt.sh"
  config.vm.provision "shell", path: "install-tools.sh"
end