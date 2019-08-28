# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "jours_feries_france"
  spec.version       = "0.0.4"
  spec.authors       = ["Louis Perello"]
  spec.email         = ["louis.perello@otily.fr"]


  spec.summary       = %q{A tiny ruby tools for computes bank holidays dates for France, for a given year. }
  spec.description   = %q{A tiny ruby tools for computes bank holidays dates for France, for a given year.}
  spec.license       = "MIT"
  spec.homepage    = 'https://github.com/lokhi/jours_feries_france_ruby.git'
  spec.metadata    = { "source_code_uri" => "https://github.com/lokhi/jours_feries_france_ruby.git" }

  spec.files = [
   "Gemfile",
   "Rakefile",
   "lib/jours_feries_france.rb",
   "bin/console"
 ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.required_ruby_version = ">= 1.9.3"

end
