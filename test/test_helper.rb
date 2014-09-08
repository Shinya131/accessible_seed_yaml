# minitest
require 'minitest/unit'

# require all lib files

Dir[File.expand_path('../../lib/**/', __FILE__) << '/*.rb'].each do |file|
  require file
end

# test data
module TestData
  SeedStringRecord01 =
    "data1:\n" +
    "  id: 1\n" +
    "  name: \"coffee\"\n"
  
  SeedStringRecord02 = 
    "data2:\n" +
    "  id: 2\n" +
    "  name: \"tea\"\n"
  
  SeedStringRecord03 = 
    "data3:\n" +
    "  id: 3\n" +
    "  name: \"water\"\n"
    
  SeedString =
    [
      SeedStringRecord01,
      SeedStringRecord02,
      SeedStringRecord03
    ].join
end