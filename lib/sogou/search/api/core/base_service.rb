require 'savon'
require_relative 'api_command'

module Sogou
  module Search
    module Api
      module Core
        class BaseService
          attr_accessor :authorization

          def initialize(url)
            @url = url
          end

          protected

          def make_command(operation, params: {}, options: {})
            ApiCommand.new(operation).tap do |command|
              command.options = options
            end
          end

          def execute_command(command, &block)
            command.execute(client, &block)
          end

          def client
            @client ||= begin
              soap_header = {}
              authorization.apply(soap_header)

              Savon.client(
                pretty_print_xml: true,
                wsdl: @url,
                namespaces: { 'xmlns:v1' => 'http://api.sogou.com/sem/common/v1' },
                env_namespace: :soapenv,
                namespace_identifier: :v11,
                soap_header: soap_header
              )
            end
          end
        end
      end
    end
  end
end
