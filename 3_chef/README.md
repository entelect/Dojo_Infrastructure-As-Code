# Example of Chef

Generate some example cookbooks
```
chef generate cookbook basic
chef generate cookbook variables
chef generate cookbook conditional
```

# Basic

Update `recipe/default.rb` to include package and service
Update `kitchen.yml` to use local boxes instead
Update `templates/default/index.html.erb` for web server

# Running

Run `kitchen converge` in any of the folders to build a Virtual Machine and run
the Chef cookbook.

# Testing

The testing cookbook can also run `chef exec rspec` for the Cookbook testing and
`kitchen test` to run the InSpec tests.

# Windows

The Kitchen configuration has been updated for HyperV. If you prefer to not
use HyperV, you can adjust the _.kitchen.yml_ files and remove the provider
options from the platforms section.

```
platforms:
  - name: hashicorp/precise64
    driver:
      provider: hyperv
      network:
        - ["private_network", {bridge: "Default Switch"}]
```

convert to

```
platforms:
  - name: hashicorp/precise64
    driver:
      network:
        - ["private_network", {bridge: "Default Switch"}]
```
