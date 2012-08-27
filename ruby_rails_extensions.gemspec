# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruby_rails_extensions/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jake hoffner"]
  gem.email         = ["jake.hoffner@gmail.com"]
  gem.description   = %q{A library of common ruby and rails utility/extension functionality that is commonly used in each of my projects.}
  gem.summary       = %q{A library of common ruby and rails utility/extension functionality that is commonly used in each of my projects.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ruby_rails_extensions"
  gem.require_paths = ["lib"]
  gem.version       = RubyRailsExtensions::VERSION
end
