# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# Prepara os dados para todos os nodes do cluster
nodes = ['192.168.33.100', '192.168.33.101', '192.168.33.102']
cluster_name = "Vagrant Cluster"

servers = []
nodes.each_with_index do |node, idx| 
  servers << {
    'hostname' => 'node' + idx.to_s,
    'ip' => node,
    'seeds' => nodes.join(","),
    'cluster_name' => cluster_name,
  }
end

# Para cada item da lista de servidores (servers) uma vm
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    servers.each do |server|
        config.vm.define server['hostname'] do |cfg|
            cfg.vm.box = "ubuntu/trusty64"
            cfg.vm.host_name = server['name']
            cfg.vm.network :private_network, ip: server['ip']
            cfg.vm.provision "ansible" do |ansible|
                ansible.extra_vars = {
                    cluster_name: server["cluster_name"],
                    seeds: server["seeds"],
                    listen_address: server['ip'],
                    rpc_address: server['ip']
                }
                ansible.verbose = 'vvvv'
                ansible.playbook = "cassandra.yml"
            end
            cfg.vm.provider "virtualbox" do |v|
                v.customize ["modifyvm", :id, "--memory", "2048"]
            end
        end
    end
end

