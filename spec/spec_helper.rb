ENV['RACK_ENV'] = 'test'

require 'bundler'
require 'rubygems'

Bundler.require(:default, :test)
require 'endpoint_base'
require 'webmock/rspec'
require 'vcr'
require 'rack/test'
require 'spree/testing_support/controllers'

require File.join(File.dirname(__FILE__), '..', 'lib', 'slack_endpoint.rb')

Sinatra::Base.environment = 'test'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.include Rack::Test::Methods
  config.include Spree::TestingSupport::Controllers
end
