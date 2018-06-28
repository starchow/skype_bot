# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skype_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "skype_bot"
  spec.version       = SkypeBot::VERSION
  spec.authors       = ["MQuy"]
  spec.email         = ["sugiacupit@gmail.com"]
  spec.homepage      = "https://github.com/Coffa/skype_bot"

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'typhoeus', '~> 1.0'
  spec.add_dependency 'faraday', '~> 0.9.2'
  spec.add_dependency 'activesupport'
end
