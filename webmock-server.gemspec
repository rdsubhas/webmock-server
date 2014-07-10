# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webmock/server/version'

Gem::Specification.new do |spec|
  spec.name          = "webmock-server"
  spec.version       = WebMock::Server::VERSION
  spec.authors       = ["rdsubhas"]
  spec.email         = ["rdsubhas@gmail.com"]
  spec.summary       = %q{A fast, lightweight live stub server using WebMock and Rack}
  spec.description   = %q{WebMock allows you to stub only Net::HTTP requests. This gem bridges the gap and allows you to run a live stub server where all requests are stubbed directly using WebMock API}
  spec.homepage      = "http://github.com/rdsubhas/webmock-server"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"

  spec.add_dependency "webmock"
  spec.add_dependency "rack"
end
