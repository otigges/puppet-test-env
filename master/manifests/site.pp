node 'pptclient.local' {
  
  file {
    '/tmp/bla':
      content => "hallo";
  }
  
  include apache
  
  File['/tmp/bla'] -> Class['apache']
  
}