require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        class Report < Core::BaseService
          def initialize
            super('ReportService')
          end

          def get_report_id(start_date, end_date, type, fields, options: {}, platform: 0, &block)
            command = make_command(
              :get_report_id,
              params: {
                report_request_type: {
                  performance_data: fields,
                  start_date: start_date,
                  end_date: end_date,
                  report_type: type,
                  platform: platform
                }
              },
              options: options
            )
            execute_command(command, &block)
          end

          def get_report_state(report_id, options: {}, &block)
            command = make_command(
              :get_report_state,
              params: { report_id: report_id },
              options: options
            )
            execute_command(command, &block)
          end

          def get_report_path(report_id, options: {}, &block)
            command = make_command(
              :get_report_path,
              params: { report_id: report_id },
              options: options
            )
            execute_command(command, &block)
          end
        end
      end
    end
  end
end
