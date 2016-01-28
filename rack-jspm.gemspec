# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/jspm/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-jspm"
  spec.version       = Rack::Jspm::VERSION
  spec.authors       = ["Michal Cichra"]
  spec.email         = ["michal@o2h.cz"]

  spec.summary       = %q{Adds proper caching headers for jspm packages}
  spec.description   = %q{Aids development by adding caching headers for jspm packages}
  spec.homepage      = "https://github.com/mikz/rack-jspm"

  spec.license = 'MIT'

  spec.files         = Dir['lib/**/*.rb'].reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
