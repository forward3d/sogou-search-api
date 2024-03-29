# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sogou/search/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'sogou-search-api'
  spec.version       = Sogou::Search::Api::VERSION
  spec.authors       = ['Min Kim']
  spec.email         = %w[developers@forward3d.com min.kim@forward3d.com]

  spec.summary       = %q(Sogou Search API ruby client)
  spec.description   = %q(Sogou Search API ruby client)
  spec.homepage      = 'https://github.com/forward3d/sogou-search-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'savon', '~> 2.12'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'simplecov', '~> 0.21'
end
