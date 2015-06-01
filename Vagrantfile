# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_check_update = false

  config.vm.define "oraclexe" do |oraclexe|
    oraclexe.vm.box = "ubuntu/trusty64"
    oraclexe.vm.hostname = "vagrant-oraclexe.vm"
    oraclexe.vm.network "private_network", ip:"192.168.56.103" #, virtualbox__intnet:true
    oraclexe.vm.synced_folder "./", "/vagrant", disabled:true
    oraclexe.vm.provider "virtualbox" do |vb|
      vb.name = "vagrant-oraclexe"
      vb.cpus = 2
      vb.memory = 4*1024
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.inventory_path = "vagrant-inventory.ini"
    ansible.playbook = "centos7-oraclexe.yml"
    ansible.extra_vars = { user:"vagrant" }
    ansible.sudo = true
    ansible.limit = 'all'
    ansible.verbose = 'vv'
  end

end
