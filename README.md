# SmoogeSpace Ansible playbooks

A general set of playbooks used to configure and update systems in the
smoogespace domain. 

## Layout

Layout of the ansible tree is based off the Fedora and CentOS ansible
trees with some personalizations. The general tree looks as follows:

```
.-|
  +-bin/
  +-inventory/ |
  |            +- group_vars/
  |            +- host_vars/
  +-playbooks
  +-roles/     |
               +- base/
			   +- httpd/
               +- {etc, etc}
```

Files which would need editing for others to use:
* ansible.cfg
* inventory/inventory
* inventory/group_vars/all
* inventory/host_vars/(name of hosts)

Currently the gitignore tries not to track directories named
private. ansible-vault is to be used to keep private variables secret.

## Targeted Architectures

This project will try to make sure it works on
* x86_64
* aarch64 ( raspberry pi 4 )

## Targets Operating Systems

This project will test to make sure it works on
* Fedora NN
* Alma Linux 8
* Alma Linux 9


