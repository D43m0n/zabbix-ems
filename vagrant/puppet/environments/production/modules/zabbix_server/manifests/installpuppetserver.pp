#
class zabbix_server::installpuppetserver inherits zabbix_server {
  $packagelist = [
    'puppetserver',
    'augeas'
  ]

  package {$packagelist:
    ensure => installed
  }

  augeas {'java args puppetserver':
    context => '/files/etc/sysconfig/puppetserver',
    changes => "set JAVA_ARGS \"'-Xms512m -Xmx512m -XX:MaxPermSize=256m'\"",
    require => Package[$packagelist],
  }

  augeas {'enable autosign on puppet master':
    context => '/files/etc/puppetlabs/puppet/puppet.conf/master',
    changes => 'set autosign true',
    notify  => Exec['puppet-generate-certificate']
  }

  exec {'puppet-generate-certificate':
    path    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    command => "${zabbix_server::puppetcmd} cert generate ${zabbix_server::fullyqualified}",
    onlyif  => "test ! -f ${zabbix_server::puppetconfig}/ssl/certs/${zabbix_server::fullyqualified}.pem",
    notify  => Service['puppetserver']
  }

  service {'puppetserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true
  }

}