# This module has  seed wrapper classes.
# Those class has some functions for data access,
# And stored Original seed data by string.
module AccessableSeed
  # This class is wrapper of seed.  
  #   Functions:
  #    - Fetch seed string by record unit.
  #    - Stored original seed string. It can fetch anytime.
  class Table
    attr_reader :original_seed
    
    # @param [String] seed for data source.
    def initialize(seed)
      @original_seed = seed
    end
    
    # @return [Array of String] seed: split by record unit.
    # @example
    #
    #  <source data>
    #  data1:
    #    id: 1
    #    name: "one"
    #  data2:
    #    id: 2
    #    name: "two"
    #
    #  <return>
    #  [
    #    'data1:\n  id: 1\n  name: "one"',
    #    'data2:\n  id: 2\n  name: "two"',
    #  ]
    def records
      setup_records if @records.nil?
      @records
    end
    
    private
    
    def setup_records
      @records = []
      seed = @original_seed.dup
      
      loop do
        if seed.empty?
          break
        end
        
        record = Record.new(fetch_first_record!(seed))
        @records << record
      end
    end
    
    def fetch_first_record!(seed)
      record_boader = seed.index(record_boader_regexp)
   
      if record_boader.nil?
        return seed.slice!(0..-1)
      end
   
      seed.slice!(0..record_boader)
    end
    
    def record_boader_regexp
      /\n[^ ]/
    end
  end
end