# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerator_comparable/version'

Gem::Specification.new do |gem|
  gem.name          = "enumerator-comparable"
  gem.version       = EnumeratorComparable::VERSION
  gem.authors       = ["Bill"]
  gem.email         = ["bill.burcham@gmail.com"]
  gem.description   = %q{Makes Enumerators Comparables}
  gem.summary       = %q{Defines spaceship (<=>) operator for Enumerator and mixes in Comparable}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
