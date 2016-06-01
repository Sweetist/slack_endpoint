# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "slack_endpoint"
  spec.version       = '0.0.1'
  spec.authors       = ['Orest Hrycyna']
  spec.email         = ['orest.hrycyna@surfdome.com']
  spec.summary       = %q{Slack Endpoint}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sentry-raven'
  spec.add_dependency 'endpoint_base'
  spec.add_dependency 'tilt-jbuilder'
  spec.add_dependency 'slack-notifier', "1.1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'sinatra-contrib'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
