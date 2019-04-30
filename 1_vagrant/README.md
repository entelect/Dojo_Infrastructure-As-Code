# Vagrant Examples

You will find a set of Vagrant Samples in this directory. While they loosely follow
the Dojo, they also include additional configuration and a more complete set of
configuration. You may use any of the Samples to help complete the Dojo or for
references in your own studies.

## Value of Vagrant

Vagrant provides a simple way to define Infrastructure by using a Domain Specific Language. The
definition can be placed in Source Control, which allows anybody else that wants to run your 
project a simple definition of what environment you want them to use. For example, if you
have developed a NodeJS project and absolutely want the project to run on version 8 of
node, you can define a Vagrant box that only installs that version. You can now ask that other
users of your project test on the provided Vagrant box, instead of trying to work out how to
install a different version of Node.

You can also test your code on different environments without having to install them manually,
which works well for Windows / Linux mixed environments. Finally, when you want to test against
Production you can configure a Vagrant Box to look like Production.

## Some Drawbacks

Vagrant and Virtual Machines are a little clunky if you want to prototype and develop rapidly,
while you can do things to help prevent long turn around times (IE: Do not destroy your Vagrant Machines)
it can still be slow to work with. Docker containers have also taken on some of the same domain
as Vagrant, and you might find that its easier to configure a Docker Image instead of a whole
Vagrant Machine. Vagrant is also not well suited for Production environments, while I have seen it 
used to provision and deploy production virtual machines, it is uncommon.

## Prerequisites

Vagrant is a tool that provides a CLI and Ruby DSL for creating Virtual Machines.
For most systems you can install [VirtualBox](https://www.virtualbox.org/) which
is what Vagrant uses by default. Vagrant can use other Hypervisors if you require,
but I would recommend looking into the Vagrant documentation for further information.

### Running on windows

Windows often provides additional challenges when running a lot of the Infrastructure
as Code tooling. Due to so many users running on Windows I will put the additional commands
here instead of leaving it to you to read the manual. If you have installed HyperV on windows
you **will** not be able to install VirtualBox. Instead you must instruct vagrant to use
HyperV instead.

You can run all of the above examples on windows by including the flag _--provider_.
For example `vagrant up --provider=hyperv`, remember to run as administrator in your prompt for
this to work correctly.

## Basic Commands

The set of basic commands for Vagrant. Please use `vagrant --help` for additional
details.

1. `vagrant init ubuntu/bionic64` - Generates a new Vagrantfile using the *ubuntu/bionic64* box
2. `vagrant up` - Downloads and starts the Virtual Machine defined in the Vagrantfile
3. `vagrant ssh` - Connects to the Virtual Machine via SSH
4. `vagrant destroy` - Destroys the Vagrant machines previously provisioned

## Using Shell Provisioning

A quick and dirty example of configuring a new machine and use the default shell
provisioner to install software on the machine.

1. Edit Vagrantfile, add the following section
   ```Ruby
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
   SHELL
   ```
2. `vagrant up` - To create a new vagrant machine and install apache HTTP server
3. `vagrant provision` - If you have already created a Vagrant Machine, you can adjust
                         it by running provision instead. Which will not recreate the
                         base machine again, but only execute the provision steps.

## Using File Provisioning

1. Edit Vagrantfile, add the following section
   ```Ruby
   config.vm.provision "file", source: "./files/index.html", destination: "index.html"
   ```
2. You might need to move the file if the default location does not work for your
   project. You can also use the Shell Provisioner if you want to move files.

## More Complex Logic

Vagrant is a DSL built on top of Ruby, which means that you can do almost any
Ruby based functionality in Vagrant. While this is extremely powerful, it can
be confusing for first time users. You can refer to the _3_file-provision_ directory for
a much more complex Vagrantfile that uses Methods, Arrays and Conditionals to
craft the Vagrant Machine.

## Notes

This approach is tied to the hardware and provisioning is very distribution dependant,
eg: package manager on ubuntu is apt-get, so this will not work on a RHEL distro.

## Helpful Links

Using a Corporate CA? Check out this Stack Overflow [answer](https://stackoverflow.com/questions/45475023/configuring-vagrant-ca-certificates)
