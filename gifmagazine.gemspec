# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gifmagazine/version'

Gem::Specification.new do |spec|
  spec.name          = "gifmagazine"
  spec.version       = Gifmagazine::VERSION
  spec.authors       = ["YuheiNakasaka"]
  spec.email         = ["yuhei.nakasaka@gmail.com"]

  spec.summary       = %q{Gifmagazine API v1 client library written in Ruby.}
  spec.description   = %q{Gifmagazine API v1 client library written in Ruby.}
  spec.homepage      = "https://github.com/creative-box-inc/gifmagazine-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
end
