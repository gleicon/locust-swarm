#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
cp agent.py roles/locust/templates
ansible-playbook -i aws_hosts.ini locust.yml --private-key ~/.ssh/aws_devel.pem

