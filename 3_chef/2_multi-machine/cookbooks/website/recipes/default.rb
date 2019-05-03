include_recipe "nodejs"

git "#{node['install_dir']}/demo-node-app" do
  repository 'https://github.com/jameshibbard/demo-node-app'
  reference 'master'
  action :sync
end

execute 'npm install' do
  cwd "#{node['install_dir']}/demo-node-app"
end

file "#{node['install_dir']}/demo-node-app/.env" do
  content "DATABASE=mongodb://192.168.50.3/mean"
end

execute 'nohup npm run watch </dev/null >/dev/null 2>&1 &' do
  cwd "#{node['install_dir']}/demo-node-app"
end
