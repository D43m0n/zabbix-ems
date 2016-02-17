#
class zabbix_client::configzabbix inherits zabbix_client {
  
  class {'::zabbix::agent':
    server               => $zabbix_client::zabbix_server,
    manage_firewall      => false,
    agent_use_ip         => false,
    enableremotecommands => 1,
    logremotecommands    => 1,
    serveractive         => $zabbix_client::zabbix_server,
    manage_resources     => true,
    monitored_by_proxy   => undef,
    listenip             => $::facts['ipaddress_eth1'],
    zbx_templates        => [
                              'Template OS Linux',
                              'Template App Apache',
                              'Template App DHCPd',
                              'Template App Nginx',
                            ]
  }

}