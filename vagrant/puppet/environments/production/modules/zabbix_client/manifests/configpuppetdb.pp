#
class zabbix_client::configpuppetdb inherits zabbix_client {

  exec {'puppet agent generate certificate':
    path    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    command => "${zabbix_client::puppetcmd} agent -t",
    onlyif  => "test ! -f ${zabbix_client::puppetconfig}/ssl/certs/${zabbix_client::fullyqualified}.pem",
  }

}