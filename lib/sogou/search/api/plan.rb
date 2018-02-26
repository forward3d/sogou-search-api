require 'savon'

module Sogou
  module Search
    module Api
      class Plan
        attr_accessor :authorization

        def initialize()
          @url = 'http://api.agent.sogou.com:8080/sem/sms/v1/CpcPlanService?wsdl'
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
