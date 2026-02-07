# -*- mode: ruby -*-
# vi: set ft=ruby :

nome1 = "caio"
nome2 = "gabriel"
xx = 22
yy = 32
xy = 22

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.ssh.insert_key = false
  config.vm.network :private_network, ip: "192.168.56.1#{xy}"
  config.vm.hostname = "#{nome1}.#{nome2}"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |v|
    v.gui = false
    v.memory = 1024
    v.check_guest_additions = false
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "./playbook_ansible.yml"
  end

end
