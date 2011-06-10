# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongo_mapper/paranoia/version"

Gem::Specification.new do |s|
  s.name        = "mongo_mapper-paranoia"
  s.version     = MongoMapper::Paranoia::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Scott Gonyea"]
  s.email       = ["me@sgonyea.com"]
  s.homepage    = ""
  s.summary     = %q{Mongo Mapper ActsAsParanoid Plugin}
  s.description = %q{Mongo Mapper ActsAsParanoid Plugin, modeled after Ryan Bigg's plugin}

  s.add_dependency 'mongo_mapper'
  s.add_dependency 'activesupport'
  s.add_dependency 'i18n'

  s.add_development_dependency 'rspec',         '~>2.6.0'
  s.add_development_dependency 'bson_ext',      '~>1.3.1'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
