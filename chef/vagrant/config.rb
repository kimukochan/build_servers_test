# used Vagrantfile

# common
# ----------------------------------------
# path
current_path = File.dirname(__FILE__) 
$path = {
  :berks_cookbooks => "#{current_path}/../berks-cookbooks",
  :site_cookbooks  => "#{current_path}/../site-cookbooks",
  :vagrant_script  => "#{current_path}/script", 
}

# application
$ruby  = {
  :version => "2.1.2",
}
$rails = {
  :version => "4.1.4",
}
$nginx = {
  :version => "1.6.1",
}
$mysql = {
  :version => "5.6",
}

# development
# ----------------------------------------
$development = {
}

# production 
# ----------------------------------------
$production = {
}

