# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blockers/version"

Gem::Specification.new do |spec|
  spec.name          = "blockers-cli-app"
  spec.version       = Blockers::VERSION
  spec.authors       = ["<szeidman>"]
  spec.email         = ["<sam.zeidman@gmail.com>"]

  spec.summary       = %q{Looks up the 20 cheapest senior blockers from goaliemonkey.com.}
  spec.homepage      = "https://github.com/szeidman/blockers-cli-app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/blockers"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "open-uri"
end
