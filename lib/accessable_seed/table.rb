module AccessableSeed
  class Table
    attr_reader :original_seed
    
    def initialize(seed)
      @original_seed = seed
    end
    
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
        
        @records << fetch_first_record!(seed)
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