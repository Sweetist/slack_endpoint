# Slack Endpoint

Simple endpoint to receive messages from Wombat and post them to Slack webhook.

## Usage

In Gemfile add:

```
gem 'slack_endpoint', github: 'surfdome/slack_endpoint'
```

### Required parameter for Endpoint

`webhook_url` - your slack integration webhook URL

### Optional parameters for webhook

`channel` - where messages should be sent

`username` - bot username

`icon_emoji` - bot emoiji icon

Those parameters can also be set per message as shown below.

### Example message

```
message: {
  body: "test test test",
  channel: "@user",
  username: "SLACK BOT",
  icon_emoji: ":ghost:",
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
    ]
  }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
