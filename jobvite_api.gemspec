# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jobvite_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'jobvite_api'
  spec.version       = JobviteApi::VERSION
  spec.authors       = ['Ricardo Echavarria']
  spec.email         = ['rgechavarria@gmail.com']

  spec.summary       = 'A Ruby based wrapper for the Jobvite API v2'
  spec.description   = 'A Ruby based wrapper for the Jobvite API v2'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").
    reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('httmultiparty')
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock', '~> 1.8.0'
  spec.add_development_dependency 'vcr', '~> 2.5.0'
end
