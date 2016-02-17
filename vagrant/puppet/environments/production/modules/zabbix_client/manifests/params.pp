#
class zabbix_client::params {
  $puppetcmd = '/opt/puppetlabs/puppet/bin/puppet'
  $puppetconfig = '/etc/puppetlabs/puppet'
  $fullyqualified = $::facts['fqdn']
  $zabbix_server = 'zabbix-server.localdomain'

  $puppetdbfiles = [
    'puppet.conf',
    'puppetdb.conf',
    'routes.yaml'
  ]

}