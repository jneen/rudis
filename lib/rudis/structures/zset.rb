class Rudis
  class ZSet < Structure
    def default_options
      {
        :type => DefaultType,
        :score_type => IntegerType
      }
    end

    def score_type
      options[:score_type]
    end

    def add(member, score=1)
      redis.zadd(key, score_type.put(score), type.put(member))
    end
    alias << add

    def rem(member)
      redis.zrem(key, type.put(member))
    end

    def incrby(member, i)
      redis.zincrby(key, i.to_i, member)
    end

    def incr(member)
      incrby(member, 1)
    end

    def rank(member)
      i = redis.zrank(key, member)
      i && i.to_i
    end

    def card
      redis.zcard(key)
    end
    alias size card
    alias length card
    alias count card

    def range(ran)
      redis.zrange(key, ran.first.to_i, ran.last.to_i)
    end

    def revrange(ran)
      redis.zrevrange(key, ran.first.to_i, ran.last.to_i)
    end
    alias rev_range revrange

    def rangebyscore(min, max)
      redis.zrangebyscore(key, score_type.put(min), score_type.put(max))
    end
    alias range_by_score rangebyscore

    def [](val)
      if val.is_a? Range
        range(val)
      else
        score(val)
      end
    end
    
    def score(member)
      score_type.get(redis.zscore(key, member))
    end

  end
end
