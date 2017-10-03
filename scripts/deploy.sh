#!/bin/bash
wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
apt-get update
apt-get install puppet -y
apt-get install git -y
	
#modify config file
cd /etc/
rm -fr puppet/

git clone https://github.com/madanmk07/puppet.git
cd puppet/


#install modules
sudo puppet module install puppetlabs-mysql --version 3.10.0
sudo puppet module install mayflower-php --version 4.0.0-beta1

#apply
puppet apply /etc/puppet/manifests/site.pp
