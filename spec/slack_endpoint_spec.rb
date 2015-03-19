require 'spec_helper'

describe SlackEndpoint::Base do

  let(:message) do
    {
      message: {
        body: "test test test",
        channel: '@korki',
        attachments: {

          author_name: "Bobby Tables",
          author_link: "http://flickr.com/bobby/",
          author_icon: "http://flickr.com/icons/bobby.jpg",

          title: "Slack API Documentation",
          title_link: "https://api.slack.com/",

          fallback: "Everything looks peachy",
          text: "Everything looks peachy",
          color: "good",

          fields: [
            {
              title: "Priority",
              value: "High",
              short: false
            }
          ],
        }
      },
      parameters: {
        webhook_url: 'https://hxxx.com/xxx',
        username: 'Availibilty',
        icon_emoji: ":ghost:"
      }
    }
  end

  it 'Posts message' do
    VCR.use_cassette("post message") do
      post '/post_message', message.to_json, auth
      expect(last_response).to be_ok
    end
  end

  it 'Returns current time' do
    post '/ping', {}.to_json, auth
    expect(last_response).to be_ok
    expect(json_response['summary']).to include Time.now.to_s
  end
end
