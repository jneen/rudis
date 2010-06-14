class Rudis
  class Structure < Base
    def type
      @options[:type]
    end

    def default_options
      {:type => DefaultType}
    end
  end
end

require_local 'structures/string'
require_local 'structures/set'
#require_local 'structures/list'
#require_local 'structures/hash'
