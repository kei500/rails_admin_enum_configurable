lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_enum_configurable/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_admin_enum_configurable'
  spec.version       = RailsAdminEnumConfigurable::VERSION
  spec.authors       = ['Kei Tsuchiya']
  spec.email         = ['kei.tsuchiya86@gmail.com']

  spec.summary       = %q{Enum configure for RailsAdmin}
  spec.description   = %q{RailsAdminEnumConfigurable is a concern that provides useful methods when use enum in RailsAdmin}
  spec.homepage      = 'https://github.com/kei500/rails_admin_enum_configurable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
