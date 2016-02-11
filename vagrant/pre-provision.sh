#!/bin/bash

# We expect these to exist
PUPPETCMD=/opt/puppetlabs/puppet/bin/puppet
INSTALLDIR=/opt/puppetlabs/puppet/modules

# This is a space separated list of Puppet modules that are to be installed
# from the Puppet Forge
MODULELIST='wdijkerman-zabbix puppetlabs-puppetdb'

# install a module
function installmodule {
  MODULE=${1}
  # Check if puppets binary and module directory are present
 
  # Check if puppet binary exists
  if [ -x ${PUPPETCMD} ]; then
    # Check if module directory exists
    if [ -d ${INSTALLDIR} ]; then
      # both prerequisits exist, continue to install Puppet modules
      echo "installing Puppet module ${MODULE} from the Puppet Forge in ${INSTALLDIR}"
      ${PUPPETCMD} module install --target-dir ${INSTALLDIR} ${MODULE}  
    else
      # If we end up here, the puppet module directory doesn't exist, probably because the latest Puppet rpm is not installed.
      echo "Target directory (${INSTALLDIR}) for Puppet modules doesn't exist. Is the latest Puppet rpm installed? Exiting"
      exit
    fi
  else
    # If we end up here, the puppet binary can't be found on the expected location.`
    echo "Puppet binary not found in ${PUPPETCMD}. Make sure it's installed. Exiting"
    exit
  fi
}

# make sure all requested modules are installed, if not, install them.
for MODULENAME in ${MODULELIST}; do
  if ${PUPPETCMD} module list | grep ${MODULENAME} > /dev/null; then
    echo "Puppet module ${MODULENAME} already installed, nothing to do"
  else
    installmodule ${MODULENAME}
  fi
done


