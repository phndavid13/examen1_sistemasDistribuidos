# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :centos_database do |node1|
    node1.vm.box = "centos64-updated"
    node1.vm.network :private_network, ip: "192.168.56.103"
    node1.vm.network "public_network", :bridge => "eth4", ip:"192.168.131.62", :auto_config => "false", :netmask => "255.255.255.0"
    node1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "4", "--name", "centos_database" ]
    end
    config.vm.provision :chef_solo do |chef2|
        chef2.cookbooks_path = "cookbooks"
        chef2.add_recipe "mirror"
        chef2.add_recipe "postgres"
        chef2.json = {"aptmirror" => {"server" => "192.168.131.254"}}
    end
  end

  config.vm.define :centos_framework do |node|
    node.vm.box = "centos64-updated"
    node.vm.network :private_network, ip: "192.168.56.102"
    node.vm.network "public_network", :bridge => "eth4", ip:"192.168.131.61", :auto_config => "false", :netmask => "255.255.255.0"
    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "4", "--name", "centos_framework" ]
    end
    config.vm.provision :chef_solo do |chef1|
    	chef1.cookbooks_path = "cookbooks"
    	#chef1.add_recipe "mirror"
        chef1.add_recipe "node"
    	chef1.json = {"aptmirror" => {"server" => "192.168.131.254"}}
    end
  end
end
