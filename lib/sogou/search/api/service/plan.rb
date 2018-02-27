require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Plan < Core::BaseService
          def initialize
            super('http://api.agent.sogou.com:8080/sem/sms/v1/CpcPlanService?wsdl')
          end

          def get_all_cpc_plan_id(options = {}, &block)
            command = make_command(:get_all_cpc_plan_id, options: options)
            execute_command(command, &block)
          end

          def get_all_cpc_plan(options = {}, &block)
            command = make_command(:get_all_cpc_plan, options: options)
            execute_command(command, &block)
          end
        end
      end
    end
  end
end
