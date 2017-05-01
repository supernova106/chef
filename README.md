## Description
- setup chef for development purpose
- framework written in Ruby and partially in Erlang (Chef Server)

## Notes
- if chef workstaion is in the same VPC as the chef server, use private ip for communication
- `.erb` extension simply means that the file can have placeholders
- use community cookbooks from Chef Supermarket.
- use Berkshelf to resolve cookbook dependencies.
- use a role to define your node's attributes and its run-list.

## Best Practices
* Chef attributes
- attribute files/default.rb < Node/recipe < Role < Environment < Automate (ohai)
- integration testing with test kitchen

```
package: Used to manage packages on a node
service: Used to manage services on a node
user: Manage users on the node
group: Manage groups
template: Manage files with embedded ruby templates
cookbook_file: Transfer files from the files subdirectory in the cookbook to a location on the node
file: Manage contents of a file on node
directory: Manage directories on node
execute: Execute a command on the node
cron: Edit an existing cron file on the node
```

```
$ chef exec bundle exec kitchen --help
Commands:
kitchen console          # Kitchen console
kitchen converge         # Change instance state to converge to provision instances
Kitchen destroy          # Change instance state to destroy and delete all info
kitchen list             # Lists one or more instances
kitchen login            # Log in to one instance
kitchen test             # Test (destroy, create, converge, setup, verify, destroy)
kitchen verify           # Verify and run automated tests on one or more inst...
```

## run-list
- 'role[NAME]'
- 'recipe[COOKBOOK::RECIPE]'
- 'recipe[COOKBOOK::RECIPE],COOKBOOK::RECIPE,role[NAME]'

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
### knife role
- `knife role from file roles/web.json`
- `knife role list`
- `knife role show web`
- `knife node run_list set node1-digitalocean "role[web]"`
- `knife node show node1-digitalocean --run--list`	

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
