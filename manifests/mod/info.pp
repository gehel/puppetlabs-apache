class apache::mod::info (
  $allow_from = ['127.0.0.1','::1'],
){
  apache::mod { 'info': }
  # Template uses $allow_from
  file { 'info.conf':
    ensure  => file,
    path    => "${apache::mod_dir}/info.conf",
    content => template('apache/mod/info.conf.erb'),
    require => Exec["mkdir ${apache::mod_dir}"],
    before  => File[$apache::mod_dir],
  }
}
