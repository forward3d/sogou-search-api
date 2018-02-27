require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Account < Core::BaseService
          def initialize
            super('AccountService')
          end

          def get_account_info(options = {}, &block)
            command = make_command(:get_account_info, options: options)
            execute_command(command, &block)
          end
        end
      end
    end
  end
end
