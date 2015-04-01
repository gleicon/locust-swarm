# Swarm for Locust.io

Ansible AWS Provisioning for Locust.io Distributed load testing. There will be one Master VM and a number of slave VMs

## AWS
	- Depends on Ansible and boto
		$ sudo pip install ansible
		$ sudo pip install boto

	- Export credentials
		$ export AWS_ACCESS_KEY_ID=<aws access key id>
		$ export AWS_SECRET_ACCESS_KEY=<aws secret access key>

	- configure group_vars/all with the data below (note slave_count is the number of slave VMs)
		ssh_key_name: aws_devel
		aws_region: us-east-1
		ami_id: ami-9eaa1cf6
		instance_type: t2.micro
		vpc_id: vpc-ffffffff
		subnet_id: subnet-ffffffff
		slave_count: 3
		cidr_ip: 10.0.0.0/16

	$ ansible-playbook -i aws_hosts.ini cassandra_aws.yml --private-key ~/.ssh/aws_devel.pem
	- aws_devel.pem is your public key
	- aws_hosts.ini file containing
		[local]
		localhost

	- use EC2 panel to remove servers or $ ansible-playbook -i ./ec2.py remove_servers.yml

## Testing agent

The testing agent is agent.py, copied into templates/ dir of both locust_master and locust_slave roles.

## Target host

The target host is configured at locust.yml variable test_host

## Master 

Access the master VM using http://ip:8090
