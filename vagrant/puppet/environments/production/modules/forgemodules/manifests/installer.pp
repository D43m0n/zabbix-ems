#
define forgemodules::installer (
  $modulename = $title, 
  $puppetcmd = '/opt/puppetlabs/puppet/bin', 
  $installdir = '/opt/puppetlabs/puppet/modules' 
) {
  
  exec {"install-puppet-forge-module-$modulename":
    path  => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    command => "$puppetcmd module install --target-dir $installdir $modulename",
    onlyif  => "test `$puppetcmd module list --modulepath $installdir | grep \"$modulename\" -c` -eq 0",
    timeout => 600,
  }
  
}