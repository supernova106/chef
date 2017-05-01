# tomcat

TODO: Enter the cookbook description here.

# Development
* testing
- **chefspec**: unit test
- **serverspec**: server test
- `mkdir -p test/integration/server/serverspec`
- `vim test/integration/server/serverspec/git_daemon_spec.rb`

```
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Git Daemon" do

  it "is listening on port 9418" do
    expect(port(9418)).to be_listening
  end

  it "has a running service of git-daemon" do
    expect(service("git-daemon")).to be_running
  end

end
```

- `kitchen create`

```
$ serverspec-init
Select OS type:

  1) UN*X
  2) Windows

Select number: 1

Select a backend type:

  1) SSH
  2) Exec (local)

Select number: 1
```

- `kitchen converge && kitchen verify`
