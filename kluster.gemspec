# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kluster/version'

Gem::Specification.new do |spec|
  spec.name          = "kluster"
  spec.version       = Kluster::VERSION
  spec.authors       = ["Chris O'Sullivan"]
  spec.email         = ["thechrisoshow@gmail.com"]
  spec.description   = %q{Create geographic clusters}
  spec.summary       = %q{Take a collection of geographic objects and figures out any clusters of them}
  spec.homepage      = "http://github.com/thechrisoshow/kluster"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "geocoder", "~> 1.1"
end
