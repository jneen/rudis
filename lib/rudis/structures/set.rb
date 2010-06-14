class Rudis
  class Set < Type
    def members
      redis.smembers(key).map do |k|
        serializer.get(k)
      end
    end
    alias all members
    alias to_a members

    def add(val)
      redis.sadd(key, serializer.put(val))
    end

    def is_member?(val)
      redis.sismember(key, serializer.put(val))
    end
    alias member? is_member?
    alias include? is_member?

    def card
      redis.scard(key)
    end
    alias count card
    alias size card
    alias length card

    def sort(*args)
      #TODO
    end
  end
end
