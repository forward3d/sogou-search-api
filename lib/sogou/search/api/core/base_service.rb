require 'savon'
require_relative '../options'
require_relative 'api_command'

module Sogou
  module Search
    module Api
      module Core
        class BaseService
          attr_accessor :authorization
          attr_accessor :client_options
          attr_accessor :env

          def initialize(service)
            @url = "http://#{service_host}/sem/sms/v1/#{service}?wsdl"
            @client_options = ClientOptions.default.dup
          end

          protected

          def make_command(operation, params: {}, options: {})
            ApiCommand.new(operation).tap do |command|
              command.params = params unless params.empty?
              command.options = options
            end
          end

          def execute_command(command, &block)
            command.execute(client, &block)
          end

          def client
            @client ||= Savon::Client.new do |savon|
              savon.wsdl(@url)
              savon.pretty_print_xml(true)
              savon.namespaces('xmlns:v1' => 'http://api.sogou.com/sem/common/v1')
              savon.env_namespace(:soapenv)
              savon.namespace_identifier(:v11)
              savon.convert_response_tags_to(lambda { |key| key.snakecase })

              soap_header = {}
              authorization.apply(soap_header) if authorization
              savon.soap_header(soap_header)

              savon.proxy(client_options.proxy_url) if client_options.proxy_url
              savon.open_timeout(client_options.open_timeout_sec) if client_options.open_timeout_sec
              savon.read_timeout(client_options.read_timeout_sec) if client_options.read_timeout_sec
            end
          end

          private

          def service_host
            "api.agent.sogou.com#{environment == 'development' ? ':8080' : ''}"
          end

          def environment
            @env ||= ENV.fetch('ENV', 'development')
          end
        end
      end
    end
  end
end
