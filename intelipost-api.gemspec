# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intelipost/api/version'

Gem::Specification.new do |spec|
  spec.name          = "intelipost-api"
  spec.version       = Intelipost::VERSION
  spec.authors       = ["Renato Alves"]
  spec.email         = ["renatodex@gmail.com"]
  spec.summary       = %q{Intelipost API Gem for Ruby}
  spec.description   = %q{Intelipost API Gem for Ruby}
  spec.homepage      = "http://github.com/renatodex/intelipost-ruby-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
