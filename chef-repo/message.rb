directory '/tmp/message' do
	owner 'bnguyen'
	group 'staff'
	mode '0755'
	action :create
end

file '/tmp/message/motd' do
	content 'hello chef'
end
