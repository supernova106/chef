#
# Cookbook:: jenkins_slave
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
case node['platform']
when 'debian', 'ubuntu'
  include_recipe 'jenkins_slave::apt'
  log "loading apt.rb"
when 'centos', 'redhat'
  include_recipe 'jenkins_slave::yum'
  log "loading yum.rb"
end
