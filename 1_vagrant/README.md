# Basic Example of starting Vagrant

1. vagrant init hashicorp/precise64
2. vagrant up
3. vagrant ssh
4. wget localhost
5. sudo apt-get install -y apache2
6. wget localhost
7. cat index.html

# Getting it done via automation

1. vagrant init hashicorp/precise64
2. Edit Vagrantfile, uncomment section
   ```
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
   SHELL
   ```
3. vagrant up
4. vagrant ssh
5. wget localhost
6. cat index.html

# Updating and extending

1. vagrant init hashicorp/precise64
2. Edit Vagrantfile, uncomment section
   ```
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
   SHELL
   ```
3. Add the following command to the shell provision section
  ```
  echo "<html><body><h1>This is not the default anymore</h1></body></html>" > /var/www/index.html
  service apache2 restart
  ```
4. vagrant up
5. vagrant ssh
6. wget localhost
7. cat index.html

# How about doing some logic

1. vagrant init hashicorp/precise64
2. Edit Vagrantfile, uncomment section
   ```
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
   SHELL
   ```
3. Add the following command to the shell provision section
  ```
  echo "<html><body><h1>This is not the default anymore</h1></body></html>" > /var/www/index.html
  service apache2 restart
  ```
4. Add the following the vagrant before the `vagrant.config`
   ```
   PROVISION = false
   ```
5. And add the following before the `config.vm.provision`
   ```
   if PROVISION
    config.vm...
   end
   ```
6. vagrant ssh
7. wget localhost
8. cat index.html

# Cleaning up

vagrant destroy

# Running on windows

You can run all of the above examples on windows by including the flag _--provider_.
For example `vagrant up --provider=hyperv`, remember to run as administrator.

# Notes

This approach is tied to the hardware and provisioning is very distribution dependant,
eg: package manager on ubuntu is apt-get, so this will not work on a RHEL distro.
