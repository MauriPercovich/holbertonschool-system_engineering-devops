# Just as in task #0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

exec { 'update':
  command  => 'sudo apt-get -y update',
  provider => shell,
  before   => Exec['install_Nginx'],
}

exec {'install_Nginx':
  command  => 'sudo apt-get -y install nginx',
  provider => shell,
  before   => Exec['add_header'],
}

exec { 'add_header':
  provider => shell,
  command  => "sudo sed -i '/listen 80 default_server/a add_header X-Served-By ${hostname};' /etc/nginx/sites-enabled/default",
  before   => Exec['restart_nginx'],
}

exec { 'restart_nginx': 
  command  => 'sudo service nginx restart',
  provider => 'shell'
  }
