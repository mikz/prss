# -*- encoding: utf-8 -*-
require File.expand_path('../lib/prss/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michal Cichra"]
  gem.email         = ["michal@o2h.cz"]
  gem.description   = %q{Simple fetcher of HDbits private RSS stream}
  gem.summary       = %q{Parses HDbits private RSS stream, downloads and saves all files to specified directory}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "prss"
  gem.require_paths = ["lib"]
  gem.version       = PRSS::VERSION

  gem.add_dependency 'thor', '~> 0.19.1'

  gem.add_development_dependency 'rspec', '~> 3.0'
end
