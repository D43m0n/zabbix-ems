#
class zabbix_server::configpuppetdb inherits zabbix_server {

  class {'::puppetdb':
    manage_firewall => false,
  } ->

  class {'::puppetdb::master::config':
    puppetdb_server => $zabbix_server::fullyqualified,
    masterless      => true,
    restart_puppet  => false
  }
  
}