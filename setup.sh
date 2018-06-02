#!/bin/bash
# A script to setup Ansible Playbook Tree so that it can be redone as
# needed. 
# 
# Written: smooge@smoogespace.com
# Initial Date:    2018-06-02
# Last Update:

# Taken from:
# http://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#alternative-directory-layout 

HOMEDIR=''
DIRECTORIES='inventories/ inventories/production/
inventories/production/group_vars/ inventories/production/host_vars/
library/ module_utils/ filter_plugins/ playbooks/ roles/
roles/common/'

FILES='inventories/hosts site.yml'

if [ -z "${HOMEDIR}" ]; then
    # We will assume the current working directory is where we want
    # this setup.
    HOMEDIR=$( pwd )
else
    echo "Homedir is set"
    if [[ ! -d ${HOMEDIR} ]]; then
	mkdir -vp ${HOMEDIR}
	if [ $? -ne 0 ]; then
	    echo "Unable to create homedir. Exiting"
	    exit 1
	fi
    else
	echo "Homedir exists"
    fi
    cd ${HOMEDIR}
    TESTDIR=$( pwd )
    if [[ ${TESTDIR} != ${HOMEDIR} ]]; then
	echo "Unable to change to ${HOMEDIR}"
	exit
    fi
fi

if [[ ! -d ${HOMEDIR}/.git ]]; then
    # We did not have a git setup for this already
	git init
	if [ $? -ne 0 ]; then
	    echo "Unable to initialize git directory. Exiting"
	    exit 1
	fi
else
    echo "Git directory already exists."
fi

for DIR in ${DIRECTORIES}; do
    mkdir -vp ${HOMEDIR}/${DIR}
    if [ $? -ne 0]; then
	echo "Unable to create directory ${DIR}"
	exit 1;
    fi;
done

for FILE in ${FILES}; do
    touch ${HOMEDIR}/${FILE}
    if [ $? -ne 0]; then
	echo "Unable to create file ${FILE}"
	exit 1;
    fi;
done

git add .
git commit -a -m 'initial files created'
