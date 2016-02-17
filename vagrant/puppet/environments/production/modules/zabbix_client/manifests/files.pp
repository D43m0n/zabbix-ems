#
define zabbix_client::files ($file = $title) {
  $puppetconfig = '/etc/puppetlabs/puppet'

  file { $file:
    ensure => file,
    path   => "${puppetconfig}/${file}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///files/${file}",
  }
}