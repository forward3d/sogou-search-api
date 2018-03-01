if ENV['COVERAGE'] = 'true'
  require 'simplecov'

  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter
  ]
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'rspec'
# require 'webmock/rspec'
require 'sogou/search/api'
require 'sogou/search/api/auth'
require 'sogou/search/api/core/base_service'

# Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  #config.include WebMock::API

  Sogou::Search::Api.logger.level = Logger::WARN
  #WebMock::Config.instance.query_values_notation = :flat_array

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
