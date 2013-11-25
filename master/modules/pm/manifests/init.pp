class pm {

  file { 
    '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
      source => 'puppet:///modules/pm/RPM-GPG-KEY-puppetlabs',
      mode => 0644, owner => root, group => root;
    '/etc/yum.repos.d/puppet-labs.repo':
      source => 'puppet:///modules/pm/puppet-labs.repo',
      mode => 0644, owner => root, group => root,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'];
    '/etc/puppet/puppet.conf':
      source => 'puppet:///modules/pm/puppet.conf',
      mode => 0644, owner => puppet, group => puppet;      
    '/etc/sysconfig/iptables':
      source => 'puppet:///modules/pm/iptables',
      mode => 0644, owner => root, group => root;
  }
  
  package {
    'puppet-server':
      ensure => present,
      require => File['/etc/yum.repos.d/puppet-labs.repo'],
  }
  
  service {
    'puppetmaster':
      ensure => running,
      require => Package['puppet-server'];
    'iptables':
      ensure => running,
      require => File['/etc/sysconfig/iptables'],
      subscribe => File['/etc/sysconfig/iptables'];
  }

}