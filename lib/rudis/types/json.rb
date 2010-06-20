
class Rudis
  module JSONType

    def self.put(val)
      require 'rubygems'
      require 'json'
      val.to_json
    end

    def self.get(val)
      require 'rubygems'
      require 'json'
      JSON.load(val)
    end
  end
end
