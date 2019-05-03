#
# Cookbook:: basic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Update the APT packages
execute 'apt-get update'

# Install apache
package 'apache2'

# Enable and Start the Apache Service
service('apache2') { action %i(enable start) }

# Create a Template for our web page
template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables = {
    site_name: node.name
  }
  notifies :restart, 'service[apache2]', :immediately
end
