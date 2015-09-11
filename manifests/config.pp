# Class: tinyproxy::config
# defined type to construct tinyproxy config
# defaults are defined below. override via hiera or other methods.
# you can use the $config_hash variable to pass other options
# not listed here.
#
define tinyproxy::config (
  $ensure         = present,
  $user           = 'tinyproxy',
  $group          = 'tinyproxy',
  $port           = '8888',
  $timeout        = '600',
  $errorfile      = '/usr/share/tinyproxy/default.html',
  $statfile       = '/usr/share/tinyproxy/stats.html',
  $syslog         = 'On',
  $syslog_level   = 'info',
  $pidfile        = '/var/run/tinyproxy/tinyproxy.pid',
  $max_clients    = '1000',
  $min_spares     = '5',
  $max_spares     = '20',
  $servers        = '10',
  $max_requests   = '0',
  $via_proxy_name = 'tinyproxy',
  $connect_ports  = ['443', '563', '873'],
  $config_hash    = {},
  ){
  file { $title :
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tinyproxy/tinyproxy.conf.erb'),
    require => Package['tinyproxy'],
  }
}
