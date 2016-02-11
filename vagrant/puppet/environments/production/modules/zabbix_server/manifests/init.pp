# Class: zabbix_server
# ===========================
#
# This module configures a zabbix server with web, database and 
# server role on a single machine
#
# Authors
# -------
#
# D43m0n <dortsen@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class zabbix_server {
  contain '::zabbix_server::configpuppetdb'
  contain '::zabbix_server::configzabbix'

  Class['::zabbix_server::configpuppetdb'] ->
  Class['::zabbix_server::configzabbix']

  notify {"notify-${module_name}":
    message => "Applying ${module_name} manifest"
  }

}
