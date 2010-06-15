class Rudis
  module SymbolType
    def self.put(val)
      val.to_s
    end
    
    def self.get(val)
      val.to_sym
    end
  end
end
