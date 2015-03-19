require 'sinatra'
require "sinatra/config_file"
require 'endpoint_base'
require 'endpoint_base/sinatra'
require 'airbrake'
require 'slack-notifier'

module SlackEndpoint
  class Base < EndpointBase::Sinatra::Base
    use Airbrake::Rack
    enable :raise_errors
    enable :logging
    set :environments, %w{development test production staging}

    register Sinatra::ConfigFile
    config_file './config/slack_config.yml'

    post '/post_message' do
      result 500, 'Missing Webhook URL' unless @config['webhook_url'].present?
      message = @payload[:message]

      notifier = Slack::Notifier.new @config['webhook_url']
      notifier.channel = value_for(:channel, 'hub')
      notifier.username = value_for(:username, 'Slack EP')

      args = {
        icon_emoji: value_for(:icon_emoji),
        attachments: [value_for(:attachments)]
      }

      notifier.ping message[:body], args
      result 200, 'Message sent to slack'
    end

    post '/ping' do
      result 200, "Hi! Time now is: #{Time.new}"
    end

    private

    def value_for(param, default = nil)
      @payload[:message][param.to_sym] || @config[param.to_s] || default
    end
  end
end
