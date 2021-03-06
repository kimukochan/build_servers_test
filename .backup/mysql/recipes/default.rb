package 'mysql-libs' do
  action :remove
end

# add mysql yum repository
remote_file "/tmp/mysql-community-release-el6-5.noarch.rpm" do
  source 'http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm'
  action :create
end

rpm_package "mysql-community-release" do
  source "/tmp/mysql-community-release-el6-5.noarch.rpm"
  action :install
end

# install mysql community server
yum_package "mysql-community-server" do
  action :install
  version "5.6.15-1.el6"
  flush_cache [:before]
end

service "mysqld" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

# secure install
root_password = node["mysql"]["root_password"]

template "/tmp/secure_install.sql" do
  owner "root"
  group "root"
  mode 0644
  source "secure_install.sql.erb"
  variables({
    :root_password => root_password,
  })
  notifies :run, "execute[secure_install]", :immediately
end

execute "secure_install" do
  command "/usr/bin/mysql -u root < /tmp/secure_install.sql"
  action :nothing
  only_if "/usr/bin/mysql -u root -e 'show databases;'"
end

# create database
#db_name = node["mysql"]["db_name"]
#execute "create_db" do
#  command "/usr/bin/mysql -u root -p#{root_password} < #{chef::config[:file_cache_path]}/create_db.sql"
#  action :nothing
#  not_if "/usr/bin/mysql -u root -p#{root_password} -D #{db_name}"
#end
#
#template "#{chef::config[:file_cache_path]}/create_db.sql" do
#  owner "root"
#  group "root"
#  mode 0644
#  source "create_db.sql.erb"
#  variables({
#    :db_name => db_name,
#  })
#  notifies :run, "execute[create_db]", :immediately
#end

# create user
#user_name     = node["mysql"]["user"]["name"]
#user_password = node["mysql"]["user"]["password"]
#execute "create_user" do
#  command "/usr/bin/mysql -u root -p#{root_password} < #{chef::config[:file_cache_path]}/create_user.sql"
#  action :nothing
#  not_if "/usr/bin/mysql -u #{user_name} -p#{user_password} -D #{db_name}"
#end
#
#template "#{chef::config[:file_cache_path]}/create_user.sql" do
#  owner "root"
#  group "root"
#  mode 0644
#  source "create_user.sql.erb"
#  variables({
#    :db_name => db_name,
#    :username => user_name,
#    :password => user_password,
#  })
#  notifies :run, "execute[create_user]", :immediately
#end

