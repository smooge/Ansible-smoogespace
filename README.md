# SmoogeSpace Ansible playbooks

A general set of playbooks used to configure and update systems in the
smoogespace domain. We will be using a similar system as Debops
https://github.com/debops/debops but not as full-featured. If it grows
in usability, a seperate project covering a 'ELOps' would be created.

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

### roles/ logic

Roles will normally be written with an eye towards a common action on a
specific rpm or set of rpms. This should allow for concentration on an
action inside a role versus trying to make a 'generic' role which does
all things that a specific rpm could do. This will limit reuse, but many
times the software is changing enough that 'reuse' is limited already.

## Targeted Architectures

This project will try to make sure it works on
* x86_64
* aarch64 ( raspberry pi 4 )

## Targets Operating Systems

This project will test to make sure it works on
* Fedora NN
* Alma Linux 8
* Alma Linux 9


