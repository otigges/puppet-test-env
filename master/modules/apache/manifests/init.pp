class apache {
  
  $server_name = $fqdn
  $document_root_dir = '/var/www'
  
  group { 'apache' :
    ensure => present
  }
  
  user { 'apache' :
    ensure => present
  }
  
  file {
    '/etc/httpd/conf.d/welcome.conf' :
      content => template('apache/welcome.conf.erb'),
      mode => 0644, owner => root, group => root,
      notify => Package['apache_server'];  
  }
  
  $apache_server = $operatingsystem ? {
      CentOS  => 'httpd',
      Fedora  => 'httpd',
      default => 'apache2',
  }

  package { $apache_server:
    ensure => present,
    alias  => 'apache_server',
  }
  
}