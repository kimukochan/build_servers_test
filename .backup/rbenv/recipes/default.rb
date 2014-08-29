# cookbook Name:: rbenv

%w{openssl-devel sqlite-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/#{node['rbenv']['user']}/.rbenv" do
  repository node["rbenv"]["rbenv_url"]
  action :sync
  user node["rbenv"]["user"]
  group node["rbenv"]["group"]
end

template ".bash_profile" do
  source ".bash_profile.erb"
  path "/home/#{node['rbenv']['user']}/.bash_profile"
  mode 0644
  owner node["rbenv"]["user"]
  group node["rbenv"]["group"]
  not_if "grep rbenv ~/.bash_profile", :environment => { :"HOME" => "/home/#{node['rbenv']['user']}" }
end

directory "/home/#{node['rbenv']['user']}/.rbenv/plugins" do
  owner node['rbenv']['user']
  group node['rbenv']['group']
  mode 0755
  action :create
end

git "/home/#{node['rbenv']['user']}/.rbenv/plugins/ruby-build" do
  repository node["rbenv"]["ruby-build_url"]
  action :sync
  user node["rbenv"]["user"]
  group node["rbenv"]["group"]
end

execute "rbenv install #{node['rbenv']['version']}" do 
  command "/home/#{node['rbenv']['user']}/.rbenv/bin/rbenv install #{node['rbenv']['version']}"
  user node["rbenv"]["user"]
  group node["rbenv"]["group"]
  environment 'HOME' => "/home/#{node['rbenv']['user']}"
  not_if { File.exists?("/home/#{node['rbenv']['user']}/.rbenv/versions/#{node['rbenv']['version']}") }
end

execute "rbenv global #{node['rbenv']['version']}" do
  command "/home/#{node['rbenv']['user']}/.rbenv/bin/rbenv global #{node['rbenv']['version']}"
  user node["rbenv"]["user"]
  group node["rbenv"]["group"]
  environment 'HOME' => "/home/#{node['rbenv']['user']}"
end

%w{rbenv-rehash bundler rails}.each do |gem|
  execute "gem install #{gem}" do
    command "/home/#{node['rbenv']['user']}/.rbenv/shims/gem install #{gem}"
    user node["rbenv"]["user"]
    group node["rbenv"]["group"]
    environment 'HOME' => "/home/#{node['rbenv']['user']}"
    not_if "/home/#{node['rbenv']['user']}/.rbenv/shims/gem list | grep #{gem}"
  end
end

