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
