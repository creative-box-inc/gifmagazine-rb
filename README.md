# Gifmagazine

Gifmagazine API v1 client library written in Ruby.

※This client gem is yet beta version.So, this is not covered all endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gifmagazine-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gifmagazine-rb

## Usage

```
require 'gifmagazine-rb'

client = Gifmagazine::Client.new(token: '')
client.gifs_search({q: '猫', limit: 2, offset: 0})
client.gifs_emotion({q: 'joy', limit: 2, offset: 0})
client.feeds_pickup
client.feeds_topic
client.feeds_jumble
```

Public api does not need a token.

Token is for sales.

See [here](https://github.com/creative-box-inc/Gifmagazine-API-Documentation) for more detail.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

