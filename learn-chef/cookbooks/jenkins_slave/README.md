# Description
- bootstrap jenkins_slave from a fresh VM/EC2 ubuntu-16
- `JENKINS_HOME` `/var/lib/jenkins`
- root directory `/home/jenkins`

# Supported platforms
- ubuntu-16

# Test
## Dependencies
- virtualbox: https://www.virtualbox.org/wiki/Downloads
- vagrant: https://www.vagrantup.com/downloads.html
- docker: https://docs.docker.com/docker-for-mac/
- Chef 12

```
kitchen test
```

## Dynamic configuration
- A local configuration will be looked for in `.kitchen.local.yml` which could be used for development purposes
- A global configuration file will also be looked for in `$HOME/.kitchen/config.yml` to set preferred defaults for all your projects
- Some examples

```
---
provisioner:
  name: chef-zero
  log_level: <%= ENV['CHEF_LOG_LEVEL'] || auto %>
```

```
kitchen init --driver=kitchen-vagrant
```

```
export KITCHEN_LOCAL_YAML=${PWD}/.kitchen.docker.yml
export KITCHEN_GLOBAL_YAML=/path/to/your/global/config.yml
export KITCHEN_PROJECT_YAML=/path/to/your/project/.kitchen.yml
```
