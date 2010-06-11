#only once
require begin
  File.expand_path(
    File.join(
      File.dirname(__FILE__),
      '..',
      'vendor',
      'core_ext',
      'init'
    )
  )
end

class Rudis
end
