spec = Gem::Specification.new do |s|
  s.name = 'rudis'
  s.version = '0.1'
  s.add_dependency 'redis', '>= 2.0'

  s.summary = 'An extensible OO redis client for ruby'
  s.description = <<-desc
    Rudis wraps redis-rb in objects that keep track of their own
    redis instances and keys.
  desc

  s.email = 'j4yferd@gmail.com'

  s.has_rdoc = false

  s.required_ruby_version '>= 1.8.7'
end
