class mariadb::repo::debian {
  $version = $mariadb::repo_version
  
  apt::key { 'mariadb':
    key         => '0xcbcb082a1bb943db',
    key_server  => 'hkp://keyserver.ubuntu.com:80',
    key_options => $key_options,
  }

  apt::source {'mariadb':
    location => 'http://ftp.osuosl.org/pub/mariadb/repo/${version}/ubuntu'.
    repos    => 'main',
  }
  

#  apt::source { 'mariadb':
#    location => "http://mirror.aarnet.edu.au/pub/MariaDB/repo/${version}/ubuntu",
#    repos    => 'main',
#  }

  if $::http_proxy and $::rfc1918_gateway == 'true' {
    $key_options = "http-proxy=${::http_proxy}"
  }
  else {
    $key_options = false
  }


}
