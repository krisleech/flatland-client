# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flatland/client/version'

Gem::Specification.new do |spec|
  spec.name          = "flatland-client"
  spec.version       = Flatland::Client::VERSION
  spec.authors       = ["Kris Leech"]
  spec.email         = ["kris.leech@gmail.com"]
  spec.summary       = "Client to send CI build data to Flatland server"
  spec.description   = "Client to send CI build data to Flatland server"
  spec.homepage      = "https://github.com/krisleech/flatland-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
end
