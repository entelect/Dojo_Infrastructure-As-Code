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
