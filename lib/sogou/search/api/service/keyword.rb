require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Keyword < Core::BaseService
          def initialize
            super('http://api.agent.sogou.com:8080/sem/sms/v1/CpcService?wsdl')
          end

          def get_cpc_by_cpc_grp_id(grp_ids, valid_keyword_only=true)
            resp = client.call(:get_cpc_by_cpc_grp_id,
                               message: { cpc_grp_ids: grp_ids, get_temp: valid_keyword_only ? 0 : 1 })
            puts resp.header
            resp.body
          end

          def get_cpc_id_by_cpc_grp_id(grp_ids, valid_keyword_only=true)
            resp = client.call(:get_cpc_id_by_cpc_grp_id,
                               message: { cpc_grp_ids: grp_ids, get_temp: valid_keyword_only ? 0 : 1  })
            puts resp.header
            resp.body
          end
        end
      end
    end
  end
end
