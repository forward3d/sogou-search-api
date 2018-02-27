require_relative '../errors'
require_relative 'logging'

module Sogou
  module Search
    module Api
      module Core
        class ApiCommand
          include Logging

          attr_accessor :operation
          attr_accessor :options

          def initialize(operation)
            @operation = operation
          end

          def execute(client, &block)
            logger.debug("Executing SOAP #{operation}")

            resp = client.call(@operation)
            result = process_response(resp)

            logger.debug("Success - #{result}")
            success(result, &block)
          rescue => e
            logger.debug("Error - #{e.inspect}")
            error(e, &block)
          end

          def process_response(response)
            header = response.header[:res_header]
            return response.body["#{@operation}_response".to_sym] if header[:desc] == 'success'

            check_error_code(header[:failures])
          end

          def check_error_code(header)
            error = case header[:code].to_i
            when 6 # Invalid username
              InvalidUserNameError
            when 8 # Wrong password
              WrongPasswordError
            when 10 # Token is invalid
              InvalidTokenError
            when 18 # Insufficient quotas
              RateLimitError
            else
              UnknownError
            end

            error.new(header[:message], code: header[:code], header: header)
          end

          private

          def success(result, &block)
            yield(result, nil)  if block_given?
            result
          end

          def error(err, &block)
            if err.is_a?(Net::ReadTimeout) || err.is_a?(SocketError)
              err = TransmissionError.new(err)
            end

            if block_given?
              yield(nil, err)
            else
              raise err
            end
          end
        end
      end
    end
  end
end
