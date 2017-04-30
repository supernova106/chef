upload:
	knife cookbook upload learn_chef_httpd
deploy:
	knife ssh 'role:web' 'sudo chef-client' --ssh-user root --identity-file ~/ebates/ssh/bean --attribute ipaddress
