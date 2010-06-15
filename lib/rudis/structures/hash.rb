class Rudis
  class Hash < Structure
    def default_options
      {
        :type => DefaultType,
        :key_type => DefaultType
      }
    end

    def key_type
      @options[:key_type]
    end

    def get(k)
      e = redis.hget(key, key_type.put(k))
      e && type.get(e)
    end
    alias [] get

    def set(k,v)
      redis.hset(key, key_type.put(k), type.put(v))
    end
    alias []= set

    def mget(*ks)
      ks.zip(redis.hmget(key, ks.map { |k|
        key_type.put(k)
      }).map { |v|
        type.get(v)
      }).to_h 
    end
    alias slice mget

    def mset(hsh)
      hsh = hsh.dup
      hsh.map! {|k,v| [key_type.put(k), type.put(v)]}
      redis.hmset(key, *hsh.to_a.flatten)
    end
    alias merge! mset

    def keys
      redis.hkeys(key).map { |k| key_type.get(k) }
    end

    def vals
      redis.hvals(key).map { |v| type.get(v) }
    end
    alias values vals

    def all
      redis.hgetall(key).map! do |k,v|
        [key_type.get(k), type.get(v)]
      end
    end
    alias to_h all

    def len
      redis.hlen(key)
    end
    alias length len
    alias count len
    alias size len

    def empty?
      len == 0
    end

    def del(k)
      redis.hdel(key, key_type.put(k))
    end

    def has_key?(k)
      redis.hexists(key, key_type.put(k))
    end
    alias include? has_key?

    def incrby(k, i)
      redis.hincrby(key, key_type.put(k), i.to_i)
    end

    def incr(k)
      incrby(k, 1)
    end

  end
end
