# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accessible_seed_yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "accessible_seed_yaml"
  spec.version       = AccessibleSeedYaml::VERSION
  spec.authors       = ["Shinya131"]
  spec.email         = ["nagai3mt5b@gmail.com"]
  spec.summary       = "AccessibleSeedYaml is wrapper of rails seed file."
  spec.description   = "AccessibleSeedYaml is wrapper of rails seed file. This wrapper provides following function: 1. Easy access interface for seed data. 2. Hold original seed data."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
