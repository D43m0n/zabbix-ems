#
class zabbix_server::configzabbix {
  
  selboolean {'httpd_can_network_connect':
    persistent => true,
    value      => on
  } ->

  class {'::apache':
    mpm_module => 'prefork',
  }
  include ::apache::mod::php

  class {'::mysql::server': }

  class {'::zabbix':
    zabbix_url       => 'localhost',
    database_type    => 'mysql',
    manage_resources => true
  }

  $zemstemplates = {
    'Template App Apache'      => 'template_app_apache.xml',
    'Template App DHCPd'       => 'template_app_dhcpd.xml',
    # 'Template App HAProxy'     => 'template_app_haproxy.xml',
    'Template App Nginx'       => 'template_app_nginx.xml',
    'Template App Radiator'    => 'template_app_dhcpd.xml',
    'Template App RdiffBackup' => 'template_app_rdiff-backup.xml',
    'Template App Redis'       => 'template_app_redis.xml',
  }

  $zemstemplates.each |$templatename, $templatesource| {
    ::zabbix::template {$templatename:
      templ_source => "puppet:///zems-templates/${templatesource}"
    }
  }
  
}