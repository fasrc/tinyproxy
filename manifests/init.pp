# == Class: tinyproxy
#
# install and configure tinyproxy
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#
# === Authors
#
# FAS RC <rchelp@fas.harvard.edu>
#
# === Copyright
#
# Copyright 2015 fasrc, unless otherwise noted.
#
class tinyproxy (
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
  ) {
  include tinyproxy::install
  include tinyproxy::service
}
