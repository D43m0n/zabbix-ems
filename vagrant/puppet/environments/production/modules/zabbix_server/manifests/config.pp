#
class zabbix_server::config {
  
  class {'apache':
    mpm_module => 'prefork',
  }
  include apache::mod::php

  class {'mysql::server': }

  class {'zabbix':
    zabbix_url    => 'localhost',
    database_type => 'mysql',
    zabbix_timezone => $facts['timezone'],
  }

  selboolean {'httpd_can_network_connect':
    persistent => true,
    value      => on
  }

}