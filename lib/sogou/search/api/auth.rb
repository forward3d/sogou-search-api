require 'base64'
require 'openssl'

module Sogou
  module Search
    module Api
      module Auth
        class V1AcccountCredentials
          USERNAME_HEADER = 'v1:username'.freeze
          PASSWORD_HEADER = 'v1:password'.freeze
          API_TOKEN_HEADER = 'v1:token'.freeze
          AUTH_HEADER = 'v1:AuthHeader'.freeze

          attr_reader :api_token
          attr_reader :username
          attr_reader :password

          def initialize(api_token, username, password)
            @api_token = api_token
            @username = username
            @password = password
          end

          def apply(hash)
            hash[AUTH_HEADER] = {
              USERNAME_HEADER => username,
              PASSWORD_HEADER => password,
              API_TOKEN_HEADER => api_token
            }
          end
        end

        class DefaultCredentials
          API_TOKEN_ENV_VAR = 'SOGOU_API_TOKEN'.freeze
          USERNAME_ENV_VAR = 'SOGOU_USERNAME'.freeze
          PASSWORD_ENV_VAR = 'SOGOU_PASSWORD'.freeze

          def self.from_env
            V1AcccountCredentials.new(
              ENV[API_TOKEN_ENV_VAR],
              ENV[USERNAME_ENV_VAR],
              ENV[PASSWORD_ENV_VAR]
              )
          end
        end

        def get_application_default
          DefaultCredentials.from_env
        end

        module_function :get_application_default
      end
    end
  end
end
