execute 'apt-get update' do
  command 'apt-get update -y'
end

execute 'apt-get upgrade' do
  command 'apt-get upgrade -y'
end

package %w(default-jre xvfb unzip python-pip) do
  action :install
end

execute 'pip install pyvirtualdisplay' do
  command 'pip install pyvirtualdisplay'
end

group 'jenkins' do
  action :create
  group_name  'jenkins'
  gid '2000'
end

user 'jenkins' do
  manage_home true
  comment 'Jenkins User'
  uid '2000'
  group 'jenkins'
  home '/home/jenkins'
  shell '/bin/bash'
end

directory '/var/lib/jenkins' do
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  action :create
end

FIREFOX_VERSION = node['firefox']['version']
FILE_NAME = "firefox-#{FIREFOX_VERSION}.tar.bz2"
FILE_PATH = "#{Chef::Config['file_cache_path']}/#{FILE_NAME}"
EXTRACT_PATH = "#{Chef::Config['file_cache_path']}"
remote_file FILE_PATH do
  source "https://ftp.mozilla.org/pub/firefox/releases/#{FIREFOX_VERSION}/linux-x86_64/en-US/#{FILE_NAME}"
  mode '0644'
  not_if { File.exists?(FILE_PATH) }
end

file '/usr/bin/firefox' do
  only_if { File.exists?("/usr/bin/firefox") }
  action :delete
end

bash 'extract_module' do
  cwd ::File.dirname(FILE_PATH)
  code <<-EOH
    mkdir -p #{EXTRACT_PATH}
    tar -xjf #{FILE_NAME} -C #{EXTRACT_PATH}
    rm -rf /opt/firefox-#{FIREFOX_VERSION}
    mv -f #{EXTRACT_PATH}/firefox /opt/firefox-#{FIREFOX_VERSION}
EOH
end

link "/usr/bin/firefox" do
  to "/opt/firefox-#{FIREFOX_VERSION}/firefox"
  link_type :symbolic
  action :create
end

CHROME_SOURCE = node['chrome']['release_url']
CHROME_FILE_PATH = "#{Chef::Config['file_cache_path']}/google-chrome-stable_current_amd64.deb"
remote_file CHROME_FILE_PATH do
  source CHROME_SOURCE
  mode '0644'
  not_if { File.exists?(CHROME_FILE_PATH) }
end

bash 'install chrome package' do
  cwd ::File.dirname(CHROME_FILE_PATH)
  code <<-EOH
    dpkg -i #{CHROME_FILE_PATH}
    apt-get install -yf
EOH
end
