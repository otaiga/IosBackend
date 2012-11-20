# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.customize ["modifyvm", :id, "--name", "ios_backend", "--memory", "512"] 
  config.vm.box = "ubuntu_bootstraped"
  config.vm.host_name = "app"
  config.vm.forward_port 22, 2222, :auto => true
  config.vm.forward_port 80, 4567
  config.vm.network :hostonly, "33.33.1.2"
  config.vm.share_folder "puppet", "/etc/puppet", "config/puppet"
end
