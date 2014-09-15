# -*- encoding: utf-8 -*-
require File.expand_path('../lib/linesman/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Walters"]
  gem.email         = ["dennis@elevatorup.com"]
  gem.summary       = %q{Determines if values are in bounds}
  gem.description   = <<-EOD
    Linesman is a simple module that helps one determine if a
    value is within a given set of bounds.
  EOD
  gem.homepage      = "http://github.com/ess/linesman"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "linesman"
  gem.require_paths = ["lib"]
  gem.version       = Linesman::VERSION

  gem.add_development_dependency 'rspec'
end
