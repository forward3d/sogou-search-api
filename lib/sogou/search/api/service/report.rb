require_relative '../core/base_service'

module Sogou
  module Search
    module Api
      module Service
        ReportRequest = Struct.new(
          :fields,
          :start_date,
          :end_date,
          :type,
          :platform,
          :stat_range,
          :format
        )

        class Report < Core::BaseService
          def initialize
            super('ReportService')
          end

          def get_report_id(request, options: {}, &block)
            unless request.fields && request.start_date && request.end_date && request.type
              raise ArgumentError, 'fields, start_date, end_date, and type cannot be nil'
            end

            report_request = {
              performance_data: request.fields,
              start_date: request.start_date,
              end_date: request.end_date,
              report_type: request.type,
            }
            report_request.merge!(platform: request.platform) if request.platform
            report_request.merge!(format: request.format) if request.format
            report_request.merge!(stat_range: request.stat_range) if request.stat_range

            command = make_command(
              :get_report_id,
              params: { report_request_type: report_request },
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
