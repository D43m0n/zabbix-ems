# zabbix_server
This module uses the [wdijkerman-zabbix](https://forge.puppetlabs.com/wdijkerman/zabbix) and [puppetlabs-puppetdb](https://forge.puppetlabs.com/puppetlabs/puppetdb) modules to:

* set up PuppetDB in masterless mode using PostgreSQL
* set up a Zabbix server with Apache and MySQL
* import zabbix-ems templates in the Zabbix server

## Things to keep in mind
* the `Template App HAProxy` currently misses some items which makes it unable to be imported.
* the `Template App Radiator` is said to be imported by this module, but it doesn't appear in the webinterface of the Zabbix server.
