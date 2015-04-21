require 'rubygems'
require 'bundler'

Bundler.require(:default)
require_relative 'lib/slack_endpoint'

run SlackEndpoint::Base
