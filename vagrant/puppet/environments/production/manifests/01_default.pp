#
# default manifest file for puppet when used with vagrant
# 
$packagelist = [
  'net-tools',
  'vim',
]

package {$packagelist:
  ensure => 'installed',
}

node /server/ {
  notice('Selecting manifests for *server*')
  include ::zabbix_server
}

node /client/ {
  notice('Selecting manifests for *client*')
}