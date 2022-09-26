# Sogou Search API

A Client GEM for [Sogou Search API](http://apihome.sogou.com/document/ss/doc1-1.jsp)

## Alpha

This library is in Alpha. We will make an effort to support the library, but we reserve the right to make incompatible
changes when necessary.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sogou-search-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sogou-search-api

## Usage

### Basic usage

To use an API, instantiate the service. For example to use the Campaign API:

```ruby
require 'sogou/search/api/auth'
require 'sogou/search/api/service/account'
require 'sogou/search/api/service/plan'

#
# Set your Sogou api credentials to ENVs
#
# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

account = Service::Account.new
account.authorization = Auth.get_application_default
account.get_account_info(options: { convert_regions_to_string: true }) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

```

### Callbacks

A block can be specified when making calls. If present, the block will be called with the result or error, rather than
returning the result from the call or raising the error. Example:

```ruby
# Read account info
account.get_account_info(options: { convert_regions_to_string: true }) do |result, err|
  if err
    # Handle error
  else
    # Handle response
  end
end
```

### Authorization using environment variables

The [Sogou Search API Auth](https://github.com/forward3d/sogou-search-api/blob/master/lib/sogou/search/api/auth.rb) also supports authorization via environment variables. Simply set the following variables
for your application:

```sh
SOGOU_API_TOKEN="YOUR SOGOU DEVELOPER API TOKEN"
SOGOU_USERNAME="YOUR SOGOU USERNAME"
SOGOU_PASSWORD="YOUR SOGOU PASSWORD"
```

### Env

There are two ways to set the environment. One is `ENV['ENV']` environment variable. Another is service attribute.
If service attribute is set, environment variable will be ignored.

```ruby
account = Service::Account.new
account.env = 'production'
```

## Logging

The client includes a `Logger` instance that can be used to capture debugging information.

To set the logging level for the client:

```ruby
Sogou::Search::Api.logger.level = Logger::DEBUG
```

When running in a Rails environment, the client will default to using `::Rails.logger`. If you
prefer to use a separate logger instance for API calls, this can be changed via one of two ways.

The first is to provide a new logger instance:

```ruby
Sogou::Search::Api.logger = Logger.new(STDERR)
```

## License

This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/forward3d/sogou-search-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

We encourage contributors to follow [Bozhidar's ruby style guide](https://github.com/bbatsov/ruby-style-guide) in this project.

Pull requests (with tests) are appreciated. Please help with:

* Reporting bugs
* Suggesting features
* Writing or improving documentation
* Fixing typos
* Cleaning whitespace
* Refactoring code
* Adding tests

If you report a bug and don't include a fix, please include a failing test.

