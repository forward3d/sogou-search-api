require 'savon'

module Sogou
  module Search
    module Api
      class Report
        attr_accessor :authorization

        def initialize()
          @url = 'http://api.agent.sogou.com:8080/sem/sms/v1/ReportService?wsdl'
        end

        def get_report_id(start_date, end_date, type, fields, options={})
          operation = client.operation(:get_report_id)
          resp = client.call(:get_report_id, message: {
            report_request_type: {
              performance_data: fields,
              start_date: start_date,
              end_date: end_date,
              report_type: type
            }
          })
          puts resp.header
          resp.body
        end

        def get_report_state(report_id)
          resp = client.call(:get_report_state, message: { report_id: report_id })

          puts resp.header
          resp.body
        end

        def get_report_path(report_id)
          resp = client.call(:get_report_path, message: { report_id: report_id })

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
