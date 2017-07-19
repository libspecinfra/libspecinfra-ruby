# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libspecinfra/version'

Gem::Specification.new do |spec|
  spec.name          = "libspecinfra"
  spec.version       = Libspecinfra::VERSION
  spec.authors       = ["Gosuke Miyashita"]
  spec.email         = ["gosukenator@gmail.com"]

  spec.summary       = "Ruby binding for libspecinfra."
  spec.description   = "Ruby binding for libspecinfra."
  spec.homepage      = "https://github.com/libspecinfra/libspecinfra-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "ffi"
end
