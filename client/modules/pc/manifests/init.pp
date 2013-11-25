class pc {
  file {
    '/etc/hosts':
      source => 'puppet:///modules/pc/hosts',
      mode => 0644, owner => root, group => root;
    '/etc/puppet/puppet.conf':
      source => 'puppet:///modules/pc/puppet.conf',
      mode => 0644, owner => puppet, group => puppet;
  }
}