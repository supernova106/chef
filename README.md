## Description
- setup chef for development purpose
- framework written in Ruby and partially in Erlang (Chef Server)

## Notes
- if chef workstaion is in the same VPC as the chef server, use private ip for communication

## Knife
- `$ knife ssh SEARCH_QUERY SSH_COMMAND (options)`
- `delivery local --help`

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

## References
- https://supermarket.chef.io/cookbooks
- https://docs.chef.io/kitchen.html
- https://docs.chef.io/custom_resources.html 
- http://bundler.io/ 

## Contact
- Binh Nguyen
