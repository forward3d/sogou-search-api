require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Keyword < Core::BaseService
          def initialize
            super('CpcService')
          end

          def get_cpc_by_cpc_grp_id(grp_ids, valid_keyword_only: true, options: {}, &block)
            command = make_command(
              :get_cpc_by_cpc_grp_id,
              params: {
                cpc_grp_ids: grp_ids,
                get_temp: valid_keyword_only(valid_keyword_only)
              },
              options: options
            )
            execute_command(command, &block)
          end

          def get_cpc_id_by_cpc_grp_id(grp_ids, valid_keyword_only: true, options: {}, &block)
            command = make_command(
              :get_cpc_id_by_cpc_grp_id,
              params: {
                cpc_grp_ids: grp_ids,
                get_temp: valid_keyword_only(valid_keyword_only)
              },
              options: options
            )
            execute_command(command, &block)
          end

          private

          def valid_keyword_only(only)
            only ? 0 : 1
          end
        end
      end
    end
  end
end
