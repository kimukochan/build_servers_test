# rpm files
default['mysql']['download_uri'] = 'http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/'
default['mysql']['rpm_suffix'] = '-5.6.19-1.el6.x86_64.rpm'

default['mysql']['rpm'] = [
  'MySQL-server',
  'MySQL-client',
  'MySQL-devel',
  'MySQL-shared',
  'MySQL-shared-compat'
]

# root
default['mysql']['root_password'] = 'root'

# if create database
default['mysql']['db_name'] = ''
default['mysql']['user']['name'] = ''
default['mysql']['user']['password'] = ''

# my.cnf default values
# mysql
default['mysql']['listen_port']   = 3306
default['mysql']['charcter_set']  = 'utf8'
default['mysql']['data_dir']      = '/usr/local/var/mysql'
default['mysql']['socket']        = '/tmp/mysql/mysql.sock'
default['mysql']['strage_engine'] = 'InnoDB'

# innodb
default['mysql']['strage_engine'] = 'InnoDB'
default['innodb']['innodb_data_dir'] = '/usr/local/var/mysql'

