# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.network "private_network", ip: "192.168.2.2"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
     vb.cpus = "2"
     vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  #config.vm.synced_folder '.', '/home/vagrant/sync', disabled: true, type: 'rsync'
  config.vm.synced_folder '.', '/vagrant'

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get -y update
    sudo apt-get -y upgrade
  SHELL

  config.vm.provision "shell", path: "scripts/setup_lua.sh"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get -y autoremove
    sudo apt-get -y clean
  SHELL
end
