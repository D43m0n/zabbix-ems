#
class zabbix_server::params {

  $puppetcmd = '/opt/puppetlabs/puppet/bin/puppet'
  $puppetconfig = '/etc/puppetlabs/puppet'
  $fullyqualified = $::facts['fqdn']
  
}