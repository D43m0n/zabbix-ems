#
class zabbix_client::preparepuppet inherits zabbix_client {

  package { 'puppetdb-termini':
    ensure => installed
  }

  $zabbix_client::puppetdbfiles.each |String $puppetdbfile| {
    ::zabbix_client::files { $puppetdbfile: }
  }

}