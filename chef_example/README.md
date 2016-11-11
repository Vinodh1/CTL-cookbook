# chef_example-cookbook

This cookbook will install and configure Java 8 Oracle flavor and nginx sever

## Supported Platforms

CentOS 7.2.

## Attributes

node['chef_example']['nginx_version'] will control the Nginx installation version
node['chef_example']['allow_downgrade'] will control downgrade of install version
node['chef_example']['worker_connections'] and node['chef_example']['keepalive_timeout'] will be
used in nginx.conf

## Usage

### chef_example::default

Include `chef_example` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef_example::default]"
  ]
}
```

## Local Tests
Run `kitchen test` and `rspec` or `chef exec rspec` in cookbook root directory for unit tests
Run `foodcritic .` for static code analysis
## License and Authors

Author:: Vinodh (<aluvinodh@gmail.com>)
