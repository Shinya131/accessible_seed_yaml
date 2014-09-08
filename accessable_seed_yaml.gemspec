# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accessable_seed_yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "accessable_seed_yaml"
  spec.version       = AccessableSeedYaml::VERSION
  spec.authors       = ["Shinya131"]
  spec.email         = ["nagai3mt5b@gmail.com"]
  spec.summary       = "AccessableSeed is wrapper of rails seed file."
  spec.description   = "AccessableSeed is wrapper of rails seed file. This wrapper add convenience access interface to rails seed file. And stored original seed string."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
