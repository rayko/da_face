# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'da_face/version'

Gem::Specification.new do |spec|
  spec.name          = "da_face"
  spec.version       = DaFace::VERSION
  spec.authors       = ["Rayko"]
  spec.email         = ["rayko.drg@gmail.com"]
  spec.summary       = %q{DataSift Interface.}
  spec.description   = %q{Interface to interact with Datasift API and get pretty data from them.}
  spec.homepage      = "https://github.com/rayko/da_face"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "api"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "json"
  spec.add_dependency "excon"
end
