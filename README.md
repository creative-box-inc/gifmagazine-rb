# Gifmagazine

Gifmagazine API v1 client library written in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gifmagazine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gifmagazine

## Usage

```
require 'gifmagazine'

client = Gifmagazine::Client.new(token: '')
client.search({q: '猫', limit: 2, offset: 0})
client.emotion({q: 'joy', limit: 2, offset: 0})
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

