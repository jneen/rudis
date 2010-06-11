class Rudis
  class << self
    attr_writer :redis
    def redis
      @redis ||= begin
        require 'rubygems'
        require 'redis'
        Redis.new
      end
    end

    attr_writer :key_base
    def key_base
      @key_base ||= 'rudis'
    end

    attr_writer :key_sep
    def key_sep
      @key_sep ||= ':'
    end

    def key(*args)
      ([key_base] + args).join(key_sep)
    end
  end
end
