# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gherkin/version"

Gem::Specification.new do |s|
  s.name        = "gherkin-ruby"
  s.version     = Gherkin::VERSION
  s.authors     = ["Marc Divins", "Josep M. Bach"]
  s.email       = ["marcdivc@gmail.com", "josep.m.bach@gmail.com"]
  s.homepage    = "http://github.com/codegram/gherkin-ruby"
  s.summary     = %q{Gherkin-ruby is a Gherkin parser in pure Ruby using Rexical and Racc}
  s.description = %q{Gherkin-ruby is a Gherkin parser in pure Ruby using Rexical and Racc}

  s.rubyforge_project = "gherkin-ruby"

  s.add_runtime_dependency 'rexical'
  s.add_runtime_dependency 'racc'
  s.add_development_dependency 'minitest'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
