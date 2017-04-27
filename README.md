## Description
- setup chef for development purpose
- framework written in Ruby and partially in Erlang (Chef Server)

## Notes
- if chef workstaion is in the same VPC as the chef server, use private ip for communication
- `.erb` extension simply means that the file can have placeholders

## Knife
- `delivery local --help`
- dryrun

```
ychef-client -Fmin --why-run
```

- list facts

```
ohai
```

### knife node
- change chef runlist

```
knife node run_list <add|remove> <node> <cookbook>::<recipe>
knife node run_list add node1-digitalocean 'runlist'
```
	
### knife status
- show status information about your nodes

```
knife status
```

### knife ssh
- use `knife ssh` to issue commands to multiple nodes at once

```
knife ssh "role:web_server" "service nginx restart" -x yourusername -a ipaddress
knife ssh 'name:node1-digitalocean' 'sudo chef-client' --ssh-user root --identity-file ~/.ssh/key --attribute ipaddress
```

- `knife search` command
- find servers uptime

```
 knife ssh "role:web" "uptime" -x ubuntu -a ec2.public_hostname
```

- run the chef-client on all nodes

```
knife ssh 'name:*' 'sudo chef-client'
```

- `$ knife ssh SEARCH_QUERY SSH_COMMAND (options)`

### knife bootstrap
- bootstrap using knife

```
knife bootstrap ADDRESS --ssh-user USER --sudo --identity-file IDENTITY_FILE --node-name node1-centos --run-list 'recipe[learn_chef_httpd]'
```

### Interactive Knife SSH

```
knife ssh "role:web_server" interactive -x yourusername -a ipaddress
```



## Resource
- part of the system, such as a file, a template, or a package

## Recipe
- a file that groups related resources, such as everything needed to configure a web server, db server or a load balancer
- install and configure software components.
- manage files.
- deploy applications.
- execute other recipes.

## Attributes
- `attributes/default/default.rb` should contain all necessary attributes declerations

## Cookbook
- `sudo chef-client --local-mode --runlist 'recipe[jenkins_slave]'`

## References
- Semantic Versioning MAJOR.MINOR.PATCH

```
MAJOR specifies a change that's incompatible with previous versions.
MINOR specifies new functionality that's backwards-compatible with previous versions.
PATCH specifies backwards-compatible bug fixes.
```

- https://www.digitalocean.com/community/tutorials/how-to-manage-your-cluster-with-chef-and-knife-on-ubuntu
- https://github.com/chef/chef-web-docs/blob/master/chef_master/source/custom_resources.rst
- https://supermarket.chef.io/cookbooks
- https://docs.chef.io/kitchen.html
- https://docs.chef.io/custom_resources.html 
- http://bundler.io/ 
- `chef generate cookbook cookbooks/jenkins_slave`
- `chef generate template cookbooks/jenkins_slave limits.conf`

## Contact
- Binh Nguyen
