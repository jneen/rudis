class Rudis
  class Structure < Base
    def default_options
      {:type => DefaultType}
    end
  end
end

require_local 'structures/string'
require_local 'structures/set'
#require_local 'structures/list'
#require_local 'structures/hash'
