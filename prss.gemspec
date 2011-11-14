# -*- encoding: utf-8 -*-
require File.expand_path('../lib/prss/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michal Cichra"]
  gem.email         = ["michal@o2h.cz"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "prss"
  gem.require_paths = ["lib"]
  gem.version       = Prss::VERSION

  gem.add_dependency 'nokogiri', '>= 1.5.0'
  gem.add_dependency 'typhoeus', '>= 0.3.2'
end
