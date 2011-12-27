# -*- encoding: utf-8 -*-
# $:.push File.expand_path("../lib", __FILE__)
# require "railzend/version"
require File.expand_path('../lib/railzend/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "railzend"
  s.version     = Railzend::VERSION
  s.authors     = ["Aaron"]
  s.email       = ["aaron.kuo@olivinesoft.com"]
  s.homepage    = ""
  s.summary     = %q{I am trying to write some libs like zend framework}
  s.description = %q{Zend Framework liked libraries}

  s.rubyforge_project = "railzend"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
