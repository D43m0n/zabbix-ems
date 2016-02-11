#
class zabbix_server::configpuppetdb {

  $puppetcmd = '/opt/puppetlabs/puppet/bin/puppet'
  $puppetdbcmd = '/opt/puppetlabs/server/apps/puppetdb/bin/puppetdb'
  $puppetconfig = '/etc/puppetlabs/puppet'
  $fullyqualified = $::facts['fqdn']
  $hostname = $::facts['hostname']

  exec {'puppet-generate-certificate':
    path    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    command => "${puppetcmd} cert generate ${fullyqualified}",
    onlyif  => "test ! -f ${puppetconfig}/ssl/certs/${fullyqualified}.pem",
  } ->

  class {'::puppetdb':
    manage_firewall => false,
  } ->

  class {'::puppetdb::master::config':
    puppetdb_server => $fullyqualified,
    masterless      => true,
    restart_puppet  => false
  }



}