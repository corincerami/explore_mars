# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'explore_mars/version'

Gem::Specification.new do |spec|
  spec.name          = "explore_mars"
  spec.version       = ExploreMars::VERSION
  spec.authors       = ["Chris C Cerami"]
  spec.email         = ["chrisccerami@gmail.com"]
  spec.date          = '2015-03-25'
  spec.summary       = "Browse photos from the Mars rover Curiosity"
  spec.description   = "A gem to find photos from the Curiosity rover. It serves as a Ruby wrapper for the Mars Curiosity API. My intention is to eventually build a similar API for the Opportunity rover, which will also be accessible through this gem."
  spec.homepage      = "http://rubygems.org/gems/explore_mars"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = "lib"

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "valid_attribute"
end
