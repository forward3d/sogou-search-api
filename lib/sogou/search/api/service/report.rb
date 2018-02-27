require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Report < Core::BaseService
          def initialize
            super('http://api.agent.sogou.com:8080/sem/sms/v1/ReportService?wsdl')
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
        end
      end
    end
  end
end
