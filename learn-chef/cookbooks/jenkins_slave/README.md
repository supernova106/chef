# jenkins_slave
- bootstrap jenkins_slave from a fresh VM/EC2 ubuntu-16
- `JENKINS_HOME` `/var/lib/jenkins`
- root directory `/home/jenkins`

# Dynamic configuration
- A local configuration will be looked for in `.kitchen.local.yml` which could be used for development purposes
- A global configuration file will also be looked for in `$HOME/.kitchen/config.yml` to set preferred defaults for all your projects

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

# Test
- install virtualbox
- vagrant
- docker cli

```
kitchen test
```

# Contact
- Bean Nguyen
