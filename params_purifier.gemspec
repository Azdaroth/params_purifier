# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'params_purifier/version'

Gem::Specification.new do |spec|
  spec.name          = "params_purifier"
  spec.version       = ParamsPurifier::VERSION
  spec.authors       = ["Karol Galanciak"]
  spec.email         = ["karol.galanciak@gmail.com"]
  spec.summary       = %q{Gem for removing empty strings in arrays in params.}
  spec.description   = %q{Gem for removing empty strings in arrays in params.}
  spec.homepage      = "https://github.com/Azdaroth/params_purifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"
  spec.add_dependency "activesupport", ">= 3.2"
  spec.add_dependency "actionpack", ">= 3.2"
end
