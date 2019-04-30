# Infrastructure as Code

You will find the practical examples for the IaC Dojo in this repository. The
repo is broken down into a the different tools that are used as examples in
the Dojo.

Each example will attempt to configure and run a basic apache web server. It
does not perform complex operations in the examples, but instead focusses on
the basics.

## Vagrant

You should be able to just install Vagrant on most platforms. By default you
can use the standard virtual machine recommended which is virtual box. Other
options are available for example Hyper-V on windows. You can change the
default provider with the _--provider_ flag on vagrant up.

You can download Vagrant from this [link](https://www.vagrantup.com/)

## Ansible

Ansible is a IaC tool that prefers configuration via YAML. You can see a few
examples of provisioning the same concepts as what was done in vagrant. If you
are on a windows machine it should attempt to use the ansible local install
instead.

You can download Ansible from this [link](https://www.ansible.com/)

## Chef

The last IaC tool used in this Dojo is Chef. Unlike Ansible, Chef uses a code
approach instead of configuration. Chef uses Ruby to provide a DSL for the
various operations and tasks.


You can download Chef from this [link](https://www.chef.io/)