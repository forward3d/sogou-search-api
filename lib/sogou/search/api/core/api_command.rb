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
          attr_accessor :params

          def initialize(operation)
            @operation = operation
            @params = {}
            @options = {}
          end

          def execute(client, &block)
            logger.debug("Executing SOAP #{operation}")

            resp = client.call(@operation, message: @params)
            result = process_response(resp)

            logger.debug("Success - #{result}")
            success(result, &block)
          rescue => e
            logger.debug("Error - #{e.inspect}")
            error(e, &block)
          end

          def process_response(response)
            logger.debug("Response Header - #{response.header}")

            header = response.header[:res_header]
            return response.body["#{@operation}_response".to_sym] if header[:desc] == 'success'

            check_error_code(header[:failures])
          end

          #
          # More error codes and descriptions can be found here
          # http://apihome.sogou.com/document/ss/doc11.jsp
          #
          def check_error_code(header, raise_error = true)
            api_header = header.is_a?(Array) ? header[0] : header
            error = case api_header[:code].to_i
            when 6 # Invalid username
              InvalidUserNameError
            when 8 # Wrong password
              WrongPasswordError
            when 10 # Token is invalid
              InvalidTokenError
            when 18 # Insufficient quotas
              RateLimitError
            when 1000011 # Plan ID does not exist
              PlanIDNotExistError
            when 1000012 # Promotion group ID does not exist
              PromotionGroupIDNotExistError
            when 1000013 # Keyword ID does not exist
              KeywordIDNotExistError
            else
              UnknownError
            end

            exception = error.new(
              api_header.fetch(:message, 'Unknown error'),
              code: api_header[:code],
              header: header
            )
            raise_error ? (raise exception) : exception
          end

          private

          def success(result)
            yield(result, nil)  if block_given?
            result
          end

          def error(err)
            if err.is_a?(Net::ReadTimeout) || err.is_a?(SocketError)
              err = TransmissionError.new(err)
            end

            if block_given?
              if err.respond_to?(:header) && err.header.is_a?(Array)
                err = err.header.map { |h| check_error_code(h, false) }
              end
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
