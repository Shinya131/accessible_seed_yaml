# minitest
require 'minitest/unit'

# require all lib files
Dir[File.expand_path('../../lib/**/', __FILE__) << '/*.rb'].each do |file|
  require file
end
