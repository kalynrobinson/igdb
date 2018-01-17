
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'igdb/version'

Gem::Specification.new do |spec|
  spec.name          = 'igdb2'
  spec.version       = Igdb::VERSION
  spec.version       = "#{spec.version}-alpha-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
  spec.authors       = ['Kalyn Robinson']
  spec.email         = ['kalyndrobinson@gmail.com']

  spec.summary       = 'A Ruby wrapper for the Internet Game Database API.'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = Dir['README.md', 'igdb.gemspec', 'lib/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'simplecov', '~> 0.15'
  spec.add_development_dependency 'vcr', '~> 4.0'
  spec.add_development_dependency 'webmock', '~> 3.2'

  spec.add_runtime_dependency 'multi_json', '~> 1.13'
  spec.add_runtime_dependency 'representable', '~> 3.0'
  spec.add_runtime_dependency 'rest-client', '~> 2.0'
end
