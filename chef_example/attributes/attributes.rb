## Java
include_attribute 'java'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] =
  '187eda2235f812ddb35c352b5f9aa6c5b184d611c2c9d0393afb8031d8198974'
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['set_etc_environment'] = true

default['chef_example']['nginx_version'] = '1.10.2-1.el7.ngx'
default['chef_example']['allow_downgrade'] = false
default['chef_example']['worker_connections'] = 1024
default['chef_example']['keepalive_timeout'] = 65