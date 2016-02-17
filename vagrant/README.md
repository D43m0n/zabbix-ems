# Development environment for zabbix-ems

This directory containts a [vagrant](https://www.vagrantup.com) configuration tailored with [VirtualBox](https://www.virtualbox.org) that will:
* deploy 2 vm's, one will be provisioned as a [Zabbix](http://www.zabbix.com) server, the other as a Zabbix client
* the Zabbix client will have zabbix-ems linked
* the Zabbix server will have zabbix-ems templates installed
* provisioning of these vm's is done by [Puppet](https://puppetlabs.com)

## Getting started
There are some things you need to prepare for vagrant, such as installing a few plugins. If you're interested, some more info on plugins can be found [here](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins).
* begin by installing [VirtualBox](https://www.virtualbox.org)
* then install [vagrant](https://www.vagrantup.com)
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
* install the _vagrant-timezone_ plugin from a terminal:
```
vagrant plugin install vagrant-timezone
```


## Things to keep in mind
* Now there is a [bug](https://github.com/dotless-de/vagrant-vbguest/issues/161)with certain versions of this plugin. You can choose to use the updated _vagrant box_ or manually install the latest _kernel_ and _kernel-devel_ rpms followed by a `vagrant reload`. There is an [other workaround][https://github.com/dotless-de/vagrant-vbguest/issues/141#issuecomment-101071914] which has been implemented in the included _Vagrantfile_.
* There is also a [bug](https://forge.puppetlabs.com/wdijkerman/zabbix#when-using-exported-resources) with the Puppet module [wdijkerman-zabbix](https://forge.puppetlabs.com/wdijkerman/zabbix) that's used in this configuration. The author of the module is aware of this issue and currently advises to run _puppet apply_ a few times: `vagrant provision server` so the templates will be installed eventually.
* After the Zabbix server is fully provisioned, 'up' the Zabbix client. It needs at least two `vagrant provision client` runs, because the first run is not able to store the _exported resources_ in PuppetDB yet. On the second run the _exported resources_ are stored in PuppetDB. Finally run a `vagrant provision server` so the Zabbix client is automatically registrated within Zabbix and the zabbix-ems templates are automatically linked.
* To take full advantage of the _wdijkerman-zabbix_ Puppet module, the deployed Zabbix server also serve's as a _Puppet Master_ but only to allow the Zabbix client to export resources to the _PuppetDB_ instance that is also running on the Zabbix server.
* the vm's are based on the _centos/7_ box as found on [HashiCorp's Atlas](https://atlas.hashicorp.com/search). You may choose a different _vagrant box_ but make sure it's one supported by zabbix-ems.
* installing puppet modules from the [puppet forge](https://forge.puppetlabs.com) **with** dependencies can be a pain. Make sure that whatever module you want to install from the puppet forge meets the dependencies of all other modules.
* don't forget: this vagrant development configuration is **not** tested on all available and/or supported boxes.
* this is a work in progress, things might break :-)
