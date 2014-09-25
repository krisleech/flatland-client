# Flatland::Client

Client to send CI build details to Flatland server

## Usage

Configure your CI server to run a script such as:

```ruby
system('gem install flatland-client')

require 'flatland/client'

Flatland::Client.configure do |config|
  config.ci :travis
  config.endpoint 'http://example.com/builds'
end

Flatland::Client.do('rspec spec')
```

## Contributing

Yes, please.
