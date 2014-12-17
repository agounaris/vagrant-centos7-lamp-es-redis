# mode: ruby
# vi: set ft=ruby :

PRIVATE_NETWORK_IP = "10.0.0.10"

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-nocm"

  config.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true
  #config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

  config.vm.network :private_network, ip: PRIVATE_NETWORK_IP
  config.vm.synced_folder "~/src", "/var/www", id: "vagrant-root",
    :type => "nfs"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", "1"]
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
  config.vm.provision :shell, :path => "scripts/dev-tools.sh"
  config.vm.provision :shell, :path => "scripts/symfony.sh"
  config.vm.provision :shell, :path => "scripts/webgrind.sh"
  config.vm.provision :shell, :path => "scripts/phpmyadmin.sh"

end
