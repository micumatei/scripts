#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install puppet -y
sudo puppet module install openstack/keystone --version ">=7.0.0 <8.0.0"
sudo puppet module install openstack/glance --version ">=7.0.0 <8.0.0"
sudo puppet module install openstack/cinder --version ">=7.0.0 <8.0.0"
sudo puppet module install openstack/nova --version ">=7.0.0 <8.0.0"
sudo puppet module install openstack/neutron --version ">=7.0.0 <8.0.0"
sudo puppet module install openstack/tempest --version ">=7.0.0 <8.0.0"
sudo puppet module install example42/network
sudo puppet module install saz/memcached

/usr/bin/env bash cd /etc/puppet/modules/glance/ && sudo wget https://patch-diff.githubusercontent.com/raw/thenoizz/puppet-glance/pull/1.patch && sudo patch -p1 -b < 1.patch && cd ~

sudo puppet apply --verbose manifests/openstack-aio-ubuntu-single-nic.pp
