#! /usr/bin/env bash

###
#
# vagrantfile.sh
# Vagrantfile template. Outputs a working Vagrantfile.
#
# @params
# CUSTOM_HOST (string)
# KEY_NAME (string)
# TOKEN (string)
#
###

CUSTOM_HOST=$1
KEY_NAME=$2
TOKEN=$3

cat  << EOF
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # make sure that 2nd parameter is defined

  config.vm.provider :digital_ocean do |provider, override|
      config.vm.hostname = '${CUSTOM_HOST}'

      override.ssh.private_key_path = '~/.ssh/id_rsa'
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"

      provider.ssh_key_name = '${KEY_NAME}'
      provider.token = '${TOKEN}'
      provider.image = 'ubuntu-14-04-x64'
      provider.region = 'TOR1'
      provider.size = '512mb'
      config.vm.synced_folder "./code", "/vagrant/code", create: true, type: "rsync", rsync__auto: true
      config.vm.provision "shell", path: "bootstrap.sh"
    end
end
EOF