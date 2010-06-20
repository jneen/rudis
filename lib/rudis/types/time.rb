class Rudis
  module TimeType
    def self.put(val)
      val.to_i
    end

    def self.get(val)
      Time.at(val.to_i)
    end
  end
end
