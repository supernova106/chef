## Description
- setup chef for development purpose
- framework written in Ruby and partially in Erlang (Chef Server)

## Notes
- if chef workstaion is in the same VPC as the chef server, use private ip for communication
- `.erb` extension simply means that the file can have placeholders

## Knife
- `$ knife ssh SEARCH_QUERY SSH_COMMAND (options)`
- `delivery local --help`
- dryrun

```
ychef-client -Fmin --why-run
```

- list facts

```
ohai
```

- bootstrap Chef Client

```
knife bootstrap <FQDN/IP>
```

- change chef runlist

```
knife node run_list <add|remove> <node> <cookbook>::<recipe>
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
- https://supermarket.chef.io/cookbooks
- https://docs.chef.io/kitchen.html
- https://docs.chef.io/custom_resources.html 
- http://bundler.io/ 
- `chef generate cookbook cookbooks/jenkins_slave`
- `chef generate template cookbooks/jenkins_slave limits.conf`

## Contact
- Binh Nguyen
