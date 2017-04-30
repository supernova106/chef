template '/etc/security/limits.conf' do
  source 'limits.conf.erb'
  action :create
end
