# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'setting_store/version'

Gem::Specification.new do |spec|
  spec.name          = "setting_store"
  spec.version       = SettingStore::VERSION
  spec.authors       = ["Owen Horner"]
  spec.email         = ["owenhorner@live.com.au"]

  spec.summary       = %q{Simple persistent settings}
  spec.description   = %q{using the pstore library, this gem allows the ability to store and retrieve settings set on an environment}
  spec.homepage      = "https://github.com/Owenhorner/setting-store"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
