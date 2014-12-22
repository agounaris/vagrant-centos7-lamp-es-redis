# mode: ruby
# vi: set ft=ruby :

PRIVATE_NETWORK_IP = "10.0.0.10"

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-nocm"

  config.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true # symfony
  config.vm.network :forwarded_port, guest: 8001, host: 8001, auto_correct: true # laravel
  config.vm.network :forwarded_port, guest: 8002, host: 8002, auto_correct: true # yii2

  config.vm.network :forwarded_port, guest: 9000, host: 9000, auto_correct: true # phpmyadmin
  config.vm.network :forwarded_port, guest: 9001, host: 9001, auto_correct: true # webgrind
  config.vm.network :forwarded_port, guest: 9200, host: 9200, auto_correct: true # ES rest interface
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true # mysql

  config.vm.network :private_network, ip: PRIVATE_NETWORK_IP
  config.vm.synced_folder "~/src", "/var/www", id: "vagrant-root", :type => "nfs" # unix
  #config.vm.synced_folder ".", "/var/www", id: "vagrant-root", :type => "smb" # windows

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

  config.vm.provision :shell, :path => "scripts/webgrind.sh"
  config.vm.provision :shell, :path => "scripts/phpmyadmin.sh"
  config.vm.provision :shell, :path => "scripts/dev-tools.sh"

  config.vm.provision :shell, :path => "scripts/symfony.sh"
  #config.vm.provision :shell, :path => "scripts/laravel.sh"
  #config.vm.provision :shell, :path => "scripts/yii2.sh"

end
