# mode: ruby
# vi: set ft=ruby :

PRIVATE_NETWORK_IP = "10.0.0.200"

Vagrant.configure("2") do |config|

  config.vm.box = "CentOS7.0-x86_64-minimal "
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  #config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

  config.vm.network :private_network, ip: PRIVATE_NETWORK_IP

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 3072]
  end

  config.vm.provision :shell, :path => "scripts/firewall.sh"
  config.vm.provision :shell, :path => "scripts/apache.sh"
  config.vm.provision :shell, :path => "scripts/php-56.sh"
  config.vm.provision :shell, :path => "scripts/mysql.sh"
  config.vm.provision :shell, :path => "scripts/node.sh"
  config.vm.provision :shell, :path => "scripts/composer.sh"
  config.vm.provision :shell, :path => "scripts/redis.sh"
  config.vm.provision :shell, :path => "scripts/elasticsearch.sh"
  config.vm.provision :shell, :path => "scripts/bootstrap.sh"

end
