# Class: zabbix_client
# ===========================
#
# Full description of class zabbix_client here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'zabbix_client':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# D43m0n <dortsen@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class zabbix_client (

    $puppetcmd = $zabbix_client::params::puppetcmd,
    $puppetconfig = $zabbix_client::params::puppetconfig,
    $fullyqualified = $zabbix_client::params::fullyqualified,
    $puppetdbfiles = $zabbix_client::params::puppetdbfiles,
    $zabbix_server = $zabbix_client::params::zabbix_server
    
  ) inherits ::zabbix_client::params {

  contain '::zabbix_client::preparepuppet'
  contain '::zabbix_client::configpuppetdb'
  contain '::zabbix_client::configzabbix'

  Class['::zabbix_client::preparepuppet'] ->
  Class['::zabbix_client::configpuppetdb'] ->
  Class['::zabbix_client::configzabbix']

  notify {"notify-${module_name}":
    message => "Applying ${module_name} manifest"
  }
}
