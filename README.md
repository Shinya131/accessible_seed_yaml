[![Gem Version](https://badge.fury.io/rb/accessible_seed_yaml.svg)](http://badge.fury.io/rb/accessible_seed_yaml)
[![Build Status](https://travis-ci.org/Shinya131/accessible_seed_yaml.svg?branch=master)](https://travis-ci.org/Shinya131/accessible_seed_yaml)
[![Coverage Status](https://coveralls.io/repos/Shinya131/accessible_seed_yaml/badge.png?branch=develop)](https://coveralls.io/r/Shinya131/accessible_seed_yaml?branch=develop)
[![Code Climate](https://codeclimate.com/github/Shinya131/accessible_seed_yaml/badges/gpa.svg)](https://codeclimate.com/github/Shinya131/accessible_seed_yaml)

## Introduction
`AccessibleSeedYaml` is wrapper of rails seed file.  
This wrapper provides following function:

1. Easy access interface for seed data.
2. Hold original seed data.

## Install

To install the [Gem](https://rubygems.org/gems/accessible_seed_yaml), run this command from a terminal/shell:

    $ gem install accessible_seed_yaml

## Example 
### Sample data
numbers.yaml
```yaml
data1:
  id: 1
  name: "one"
data2:
  id: 2
  name: "two"
data3:
  id: 3
  name: "three"
```

### Example of `AccessibleSeedYaml::Table`
```ruby
require 'accessible_seed_yaml'

original_seed = File.read('numbers.yaml')

@table = AccessibleSeedYaml::Table.new(original_seed)

# Instance is providing data access interface.
@table.records
# => 
# [
#   #<AccessibleSeedYaml::Record:0x007f91552770c0
#    @original_seed="data1:\n  id: 1\n  name: \"one\"\n",
#    @seed_data_by_hash={"data1"=>{"id"=>1, "name"=>"one"}}>,
#   #<AccessibleSeedYaml::Record:0x007f915526c238
#    @original_seed="data2:\n  id: 2\n  name: \"two\"\n",
#    @seed_data_by_hash={"data2"=>{"id"=>2, "name"=>"two"}}>,
#   #<AccessibleSeedYaml::Record:0x007f91552662c0
#    @original_seed="data3:\n  id: 3\n  name: \"three\"",
#    @seed_data_by_hash={"data3"=>{"id"=>3, "name"=>"three"}}>
# ]

@table.records[0]
# => #<AccessibleSeedYaml::Record:0x007f9155725068
# @original_seed="data1:\n  id: 1\n  name: \"one\"\n",
# @seed_data_by_hash={"data1"=>{"id"=>1, "name"=>"one"}}>

# Instance is holding original seed.
@table.original_seed == original_seed
# => true
```
### Example of `AccessibleSeedYaml::Record`
```ruby
@recoed = @table.records[0]

@recoed
# => #<AccessibleSeedYaml::Record:0x007f9155725068
#     @original_seed="data1:\n  id: 1\n  name: \"one\"\n",
#     @seed_data_by_hash={"data1"=>{"id"=>1, "name"=>"one"}}>

# Instance is providing data access interface.
@recoed.attributes          # => {"id"=>1, "name"=>"one"}
@recoed.attributes["id"]    # => 1
@recoed.attributes["name"]  # => "one"

# Instance is holding original seed.
@recoed.original_seed # => "data1:\n  id: 1\n  name: \"one\"\n"
```
