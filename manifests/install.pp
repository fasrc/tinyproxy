# Class: tinyproxy::install
# install the pkg
#
class tinyproxy::install {
  ensure_packages('tinyproxy', { 'ensure' => 'latest' })
  ensure_resource('tinyproxy::config', '/etc/tinyproxy/tinyproxy.conf')
}
