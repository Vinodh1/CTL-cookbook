#
# Cookbook Name:: chef_example
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
node.normal['selinux']['state'] = 'permissive'

include_recipe 'selinux::default'

include_recipe 'java::default'

cookbook_file '/etc/yum.repos.d/nginx.repo' do
  source 'nginx.repo'
end

package 'nginx' do
  version node['chef_example']['nginx_version']
  # allow_downgrade node['chef_example']['allow_downgrade']
  action :install
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    worker_connections: node['chef_example']['worker_connections'],
	keepalive_timeout: node['chef_example']['keepalive_timeout']
  )
  notifies :restart, 'service[nginx]', :delayed
end

service 'nginx' do
  action [:enable, :start]
end