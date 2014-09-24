# This module has seed wrapper classes.
# Those wrapper provides following function:
# 1. Easy access interface for seed data.
# 2. Hold original seed data.
module AccessibleSeed
  # This class is wrapper of seed.  
  #   Functions:
  #    - Fetch seed data by record unit.
  #    - Stored original seed string. It can fetch anytime.
  class Table
    attr_reader :original_seed
    
    # @param [String] seed for data source.
    def initialize(seed)
      @original_seed = seed
    end
    
    # @return [Array of AccessibleSeed::Record] seed data. It split by record unit.
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
    #   #<AccessibleSeed::Record:0x007f91552770c0
    #    @original_seed="data1:\n  id: 1\n  name: \"one\"\n",
    #    @seed_data_by_hash={"data1"=>{"id"=>1, "name"=>"one"}}>,
    #   #<AccessibleSeed::Record:0x007f915526c238
    #    @original_seed="data2:\n  id: 2\n  name: \"two\"\n",
    #    @seed_data_by_hash={"data2"=>{"id"=>2, "name"=>"two"}}>,
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