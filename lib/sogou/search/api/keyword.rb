require 'savon'

module Sogou
  module Search
    module Api
      class Keyword
        attr_accessor :authorization

        def initialize()
          @url = 'http://api.agent.sogou.com:8080/sem/sms/v1/CpcService?wsdl'
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

        def client
          @client ||= begin
            soap_header = {}
            authorization.apply(soap_header)

            Savon.client(
              pretty_print_xml: true,
              wsdl: @url,
              namespaces: { "xmlns:v1" => "http://api.sogou.com/sem/common/v1" },
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
