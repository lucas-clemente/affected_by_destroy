# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'affected_by_destroy/version'

Gem::Specification.new do |gem|
  gem.name          = "affected_by_destroy"
  gem.version       = AffectedByDestroy::VERSION
  gem.authors       = ["Lucas Clemente"]
  gem.email         = ["luke.clemente@gmail.com"]
  gem.description   = %q{Rails plugin showing which related records will be deleted from DB when :dependent => :destroy is used}
  gem.summary       = %q{Rails plugin showing which related records will be deleted from DB when :dependent => :destroy is used}
  gem.homepage      = "https://github.com/lucas-clemente/affected_by_destroy"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
