# minitest
require 'minitest/unit'

# require all lib files
Dir[File.expand_path('../../lib', __FILE__) << '/*.rb'].each do |file|
  require file
end

# test data
module TestData
  SeedString = 
    "data1:" +
    "  id: 1" +
    "  name: \"coffee\"" +
    "data2:" +
    "  id: 2" +
    "  name: \"tea\""
end