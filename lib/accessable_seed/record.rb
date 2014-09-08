require 'yaml'

module AccessableSeed
  class Record
    attr_reader :original_seed
    
    def initialize(seed_for_one_record)
      @original_seed = seed_for_one_record
      exchange_to_hash
    end
    
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