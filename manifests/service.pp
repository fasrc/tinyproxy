# Class: tinyproxy::service
# start the service
#
class tinyproxy::service {
  service { 'tinyproxy' :
    ensure    => running,
    enable    => true,
    require   => [ Package['tinyproxy'], File['/etc/tinyproxy/tinyproxy.conf'] ],
    subscribe => [ File['/etc/tinyproxy/tinyproxy.conf'], Package['tinyproxy'] ],
  }
}
