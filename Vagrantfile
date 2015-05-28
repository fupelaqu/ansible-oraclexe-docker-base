# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_check_update = false

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/precise64"
#    ubuntu.vm.box_url = 
    ubuntu.vm.hostname = "vagrant-ubuntu.vm"
    ubuntu.vm.network "private_network", ip:"192.168.56.102"#, virtualbox__intnet:true
    ubuntu.vm.synced_folder "./", "/vagrant", disabled:true
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = "vagrant-ubuntu"
      vb.cpus = 2
      vb.memory = 4*1024
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.inventory_path = "vagrant-inventory.ini"
    ansible.playbook = "ubuntu.yml"
    ansible.extra_vars = { user:"vagrant" }
    ansible.sudo = true
    ansible.limit = 'all'
    ansible.verbose = 'vv'
  end

end
