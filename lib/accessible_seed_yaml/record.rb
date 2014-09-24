require 'yaml'
module AccessibleSeedYaml
  # This class is wrapper of seed for one record.
  #   Functions:
  #    - Fetch seed attributes by hash.
  #    - Stored original seed string. It can fetch anytime.
  class Record
    attr_reader :original_seed
    
    # @param [String] seed_for_one_record seed string for one record.
    # @raise [ArgumentError] if argument has not only one key then raise.
    # @example
    #  <Correct>
    #  ````
    #  data1:
    #    id: 1
    #    name: "one"
    #  ````
    #   => this is one record.
    #
    #  <Wrong>
    #  ````
    #  data1:
    #    id: 1
    #    name: "one"
    #  data2:
    #    id: 2
    #    name: "two"
    #  ````
    #   => this is tow record.
    #
    def initialize(seed_for_one_record)
      @original_seed = seed_for_one_record
      exchange_to_hash
    end
    
    # @return [Hash] attributes of seed data by hash.
    # @example
    #  <source>
    #  data1:
    #    id: 1
    #    name: "one"
    #
    #  <return>
    #  {"id" => 1, "name" => "one"}
    def attributes
      @seed_data_by_hash.values.first
    end
    
    private
    
    def exchange_to_hash
      @seed_data_by_hash ||= YAML.load(@original_seed)
      
      unless @seed_data_by_hash.size == 1
        raise ArgumentError.new('original_seed key size is not 1.')
      end
    end
  end
end