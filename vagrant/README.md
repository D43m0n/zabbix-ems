# Development environment for zabbix-ems

This directory containts a [vagrant](https://www.vagrantup.com) configuration tailored with [VirtualBox](https://www.virtualbox.org) that will:
* deploy 2 vm's, one will be provisioned as a [Zabbix](http://www.zabbix.com) server, the other as a Zabbix client
* the Zabbix client will have zabbix-ems installed
* the Zabbix server will have zabbix-ems templates installed
* provisioning of these vm's is done by [Puppet](https://puppetlabs.com)

## Getting started
There are some things you need to prepare for vagrant, such as installing a few plugins. If you're interested, some more info on plugins can be found [here](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins).
* install the _vagrant-hostmanager_ plugin from a terminal:
```
vagrant plugin install vagrant-hostmanager
```
* install the _vagrant-puppet-install_ plugin from a terminal:
```
vagrant plugin install vagrant-puppet-install
```
* install the _vagrant-vbguest_ plugin from a terminal:
```
vagrant plugin install vagrant-vbguest
```

## Things to keep in mind
Now there is a [bug](https://github.com/dotless-de/vagrant-vbguest/issues/161) with certain versions of this plugin. You can choose to use the updated _vagrant box_ or manually install the latest _kernel_ and _kernel-devel_ rpms followed by a `vagrant reload`. There is an [other workaround][https://github.com/dotless-de/vagrant-vbguest/issues/141#issuecomment-101071914] which has been implemented in the included _Vagrantfile_.
* the vm's are based on the _centos/7_ box as found on [HashiCorp's Atlas](https://atlas.hashicorp.com/search). You may choose a different _vagrant box_ but make sure it's one supported by zabbix-ems.
* installing puppet modules from the [puppet forge](https://forge.puppetlabs.com) **with** dependencies can be a pain. Make sure that whatever module you want to install from the puppet forge meets the dependencies of all other modules.
* don't forget: this vagrant development configuration is **not** tested on all available and/or supported boxes.
* this is a work in progress, things might break :-)
