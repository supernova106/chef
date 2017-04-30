# git

TODO: Enter the cookbook description here.

# Development
- `chef generate cookbook git`
- check kitchen version `kitchen -v`
- `cd git && kitchen init` overwrite `.kitchen.yml` and `chefignore`
- check list of platforms `kitchen list`

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
export KITCHEN_GLOBAL_YAML=/path/to/your/global/config.yml
export KITCHEN_PROJECT_YAML=/path/to/your/project/.kitchen.yml
export KITCHEN_LOCAL_YAML=/path/to/your/local/.kitchen.local.yml
```

# Dependencies
- `Berksfile` Test Kitchen will use Berkshelf to resolve dependencies.
- `Cheffile` Test Kitchen will use Librarian-Chef to resolve dependencies.
- `cookbooks/` directory: Test Kitchen will use that.
- `metadata.rb` then this project is a cookbook and Test Kitchen will use that.
- Otherwise we're out of options, so Test Kitchen will create a fake cookbook and use that so that Chef has just enough to perform an empty Chef run.
