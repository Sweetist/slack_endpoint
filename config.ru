require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require(:default)
require_relative 'lib/slack_endpoint'

run SlackEndpoint::Base
