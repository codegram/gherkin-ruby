# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gherkin/version"

Gem::Specification.new do |s|
  s.name        = "gherkin"
  s.version     = Gherkin::VERSION
  s.authors     = ["Marc Divins", "Josep M. Bach"]
  s.email       = ["marcdivc@gmail.com", "josep.m.bach@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "gherkin"

  s.add_runtime_dependency 'parslet'
  s.add_development_dependency 'minitest'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
