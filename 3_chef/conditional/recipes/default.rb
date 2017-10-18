#
# Cookbook:: conditional
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'apache2'

service('apache2') { action %i(enable start) }

update_page = node['conditional']['create_page']

template '/var/www/index.html' do
  source 'index.html.erb'
  notifies :restart, 'service[apache2]', :immediately
  only_if { update_page }
end
