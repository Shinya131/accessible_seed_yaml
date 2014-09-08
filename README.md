[![Build Status](https://travis-ci.org/Shinya131/accessable_seed_yaml.svg?branch=master)](https://travis-ci.org/Shinya131/accessable_seed_yaml)
[![Coverage Status](https://coveralls.io/repos/Shinya131/accessable_seed_yaml/badge.png?branch=master)](https://coveralls.io/r/Shinya131/accessable_seed_yaml?branch=master)
[![Code Climate](https://codeclimate.com/github/Shinya131/accessable_seed_yaml/badges/gpa.svg)](https://codeclimate.com/github/Shinya131/accessable_seed_yaml)

# Introduction
`AccessableSeed` is wrapper of rails seed file.  
This wrapper provide next function.  

- 1. Convenience access to seed data:  
 - It provide record unit access interface and attribute unit access interface.  
- 2. Store original seed string:  
 - You can fetch original seed string anytime.  
 - Does not happen notation shake.  

# Example 
## Sample data
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

## Example of `AccessableSeed::Table`
```ruby
original_seed = File.read('numbers.yaml')
@table = AccessableSeed::Table.new(original_seed)

# Function1: Fetch seed. It split by record unit.
@table.records 
# => 
#   [
#     "data1:\n  id: 1\n  name: \"one\"",
#     "data2:\n  id: 2\n  name: \"two\"",
#     "data3:\n  id: 3\n  name: \"three\"",
#   ]
#  

# function2: Fetch Original Seed.
@table.original_seed == original_seed #=> true

```

## Example of `AccessableSeed::Record`
```ruby
seed_for_one_record = @table.records.first
# => "data1:\n  id: 1\n  name: \"one\""
record = AccessableSeed::Record.new(seed_for_one_record)

# function1: Access by attribute
record.attributes # => {"id" => 1, "name" => "one"}

record.attributes["id"] # => 1
record.attributes["name"] # => "one"

# function2: Fetch Original Seed.
record.original_seed # => "data1:\n  id: 1\n  name: \"one\""
```
