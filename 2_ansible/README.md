# Initial setup

```
pip install ansible
vagrant init hashicorp/precise64
```

We want to configure ansible to install apache2 instead of doing it via vagrant
shell.

1. Create Vagrantfile as per example in this folder.
2. Create playbook.yml as per example in this folder.
3. Create template/index.html.j2 as per example in this folder.
4. Run `vagrant up`

Apply each example as required

# Windows

You cannot install ansible for windows. Instead you have to configure the vagrant
machines to use ansible local instead. This will install ansible to the local
virtual machine and executes ansible from the virtual machine instead.

For example:
```
Vagrant.configure("2") do |config|
  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

The example Vagrantfile can be found in _x_windows_.
