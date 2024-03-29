# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saj_collector/version'

Gem::Specification.new do |spec|
  spec.name          = 'saj_collector'
  spec.version       = SAJCollector::VERSION
  spec.authors       = ['Johnny Willemsen']
  spec.email         = ['jwillemsen@remedy.nl']

  spec.summary       = 'Pull statistics from SAJ Solar Inverter and push them to PVOutput'
  spec.homepage      = 'https://github.com/jwillemsen/saj_collector'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.required_ruby_version = '>= 2.6'

  spec.add_dependency 'ipaddress'
  spec.add_dependency 'pvoutput', '> 1.0'
end
