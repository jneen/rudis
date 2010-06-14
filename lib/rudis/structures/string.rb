class Rudis
  class String < Structure
    def set(val)
      redis[key] = serializer.put(val)
    end

    def raw(val)
      redis[key]
    end
    alias to_s raw

    def get(val)
      serializer.get(redis[key])
    end

    def getset(val)
      redis.getset(serializer.put(val))
    end
  end
end
