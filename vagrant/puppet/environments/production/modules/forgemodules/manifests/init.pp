# Class: forgemodules
# ===========================
#
# Install or remove any module from the puppet-forge on any location.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `modulename (or title)`
# This is the name of the puppet module as how it's installed manually by 
# the "puppet module install" command.
# 
# * `puppetcmd`
# Location of the puppet binary. On 3.x versions of Puppet this is usually
# located in "/usr/bin/puppet", on 4.x versions of Puppet this is usually
# "/opt/puppetlabs/puppet/bin/puppet". Puppet 4.x is the default.
# 
# * `installdir`
# Where to install the puppet module. Depending on your needs, this could be
# restricted to a specific directory, or one of the "$modulepath" directories
# Puppet already knows about. Puppet 4.x is the default.
#
#
# Examples
# --------
#
# @example
#    class anyclass {
#      forgemodules::installer {'puppetlabs-stdlib':
#        puppetcmd => '/opt/puppetlabs/bin/puppet',
#        installdir => '/opt/puppetlabs/modules'
#      }
#      
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
class forgemodules {

}