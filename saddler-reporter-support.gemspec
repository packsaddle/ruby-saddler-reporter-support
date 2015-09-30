# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saddler/reporter/support/version'

Gem::Specification.new do |spec|
  spec.name          = 'saddler-reporter-support'
  spec.version       = Saddler::Reporter::Support::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       = 'Interface for saddler-reporter. And utilities for saddler-reporter.'
  spec.description   = 'Interface for saddler-reporter. And utilities for saddler-reporter.'
  spec.homepage      = 'https://github.com/packsaddle/ruby-saddler-reporter-support'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'nori'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
