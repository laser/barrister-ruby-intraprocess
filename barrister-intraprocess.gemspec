# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barrister-intraprocess/version'

Gem::Specification.new do |spec|
  spec.name          = "barrister-intraprocess"
  spec.version       = Barrister::IntraProcess::VERSION
  spec.authors       = ["Erin Swenson-Healey"]
  spec.email         = ["erin.swenson.healey@gmail.com"]
  spec.summary       = %q{An intra-process transport and server-container for Barrister RPC.}
  spec.description   = %q{Use Barrister RPC to enforce call semantics between client and server - with both running in the same process. Useful in the beginning of a project.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "barrister", '~> 0'
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency 'rspec', '~> 0'
end
