class Rudis
  class Type
    attr_writer :redis
    def redis
      @redis ||= Rudis.redis
    end

    class NoKeyError < StandardError; end
    def key(*args)
      raise NoKeyError unless @key
      Rudis.key(@key, *args)
    end

    def initialize(key, options={})
      options.rmerge!(
        :serializer => StringSerializer.new
      )

      @key = key

      options.each do |k,v|
        instance_variable_set(:"@#{k}", v)
      end
    end
  end
end

require_local 'type/string'
require_local 'type/set'
require_local 'type/list'
require_local 'type/hash'
