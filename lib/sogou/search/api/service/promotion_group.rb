require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class PromotionGroup < Core::BaseService
          def initialize
            super('http://api.agent.sogou.com:8080/sem/sms/v1/CpcGrpService?wsdl')
          end

          def get_cpc_grp_by_cpc_plan_id(plan_ids, options = {}, &block)
            command = make_command(:get_cpc_grp_by_cpc_plan_id,
                                   params: { cpc_plan_ids: plan_ids },
                                   options: options)
            execute_command(command, &block)
          end

          def get_cpc_grp_id_by_cpc_plan_id(plan_ids, options = {}, &block)
            command = make_command(:get_cpc_grp_id_by_cpc_plan_id,
                                   params: { cpc_plan_ids: plan_ids },
                                   options: options)
            execute_command(command, &block)
          end
        end
      end
    end
  end
end
