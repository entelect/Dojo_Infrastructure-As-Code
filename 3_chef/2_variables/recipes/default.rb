#
# Cookbook:: basic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'apt-get update'

package 'apache2'

service('apache2') { action %i(enable start) }

template '/var/www/index.html' do
  source 'index.html.erb'
  variables :samples => 'variables'
  notifies :restart, 'service[apache2]', :immediately
end
