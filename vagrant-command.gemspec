# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "vagrant-command"
  spec.version = 1
  spec.authors = ["Frank Gerards@M-net"]
  spec.email = ["frank.gerards@m-net.de"]
  spec.description = %q{defines multiple custom commands to use for simple interaction with m-net TYPO3 vagrant VM.}
  spec.summary = spec.description
  spec.homepage = "https://github.com/fgerards/vagrant-command.git"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) {|f| File.basename(f)}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0"
end