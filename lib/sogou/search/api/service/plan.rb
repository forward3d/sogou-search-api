require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Plan < Core::BaseService
          def initialize
            super('http://api.agent.sogou.com:8080/sem/sms/v1/CpcPlanService?wsdl')
          end

          def get_all_cpc_plan_id
            resp = client.call(:get_all_cpc_plan_id)
            puts resp.header
            resp.body
          end

          def get_all_cpc_plan
            resp = client.call(:get_all_cpc_plan)
            puts resp.header
            resp.body
          end
        end
      end
    end
  end
end
