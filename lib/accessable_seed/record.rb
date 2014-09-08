require 'yaml'

module AccessableSeed
  class Record
    attr_reader :original_seed
    
    def initialize(seed_for_one_record)
      @original_seed = seed_for_one_record
    end
    
    def attributes
      # unless exchange_to_hash.size == 1
      #   raise
      # end
 
      exchange_to_hash.values.first
    end
    
    private
    
    def exchange_to_hash
      @seed_data_by_hash ||= YAML.load(@original_seed)
    end
  end
end