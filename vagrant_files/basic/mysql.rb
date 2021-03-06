Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Installing MySQL
  config.vm.provision "shell", inline: "apt-get --allow-unauthenticated -q -y  install mysql-server"
  config.vm.provision "shell", inline: "mysqladmin -u root password vagrant"
  config.vm.provision "shell", inline: "sed -i \"s/bind-address[[:space:]]*\= 127\.0\.0\.1/bind-address           \= \*/g\" /etc/mysql/my.cnf"
  config.vm.provision "shell", privileged: false, inline: "mysql -u root --password='vagrant' -e \"GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'vagrant'\"";  
  config.vm.provision "shell", inline: "systemctl restart mysql.service"
end