# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.6.0'
Vagrant.configure('2') do |config|
  config.vm.define 'vigor' do |c|
    c.vm.box = 'yungsang/coreos'
    c.vm.hostname = 'vigor'
    c.vm.network :private_network, ip: '10.10.10.200'

    c.vm.synced_folder '.', '/var/vigor', {
      id: 'core',
      nfs: true,
      mount_options: ['nolock,vers=3,udp']
    }

    c.vm.provision 'docker' do |d|
      d.build_image '/var/vigor',
        args: '-t "vigor"'
      d.run 'vigor',
        cmd: 'bash -l',
        args: "-it -v '/var/vigor:/var/vigor'"
    end
  end
end
