require 'sogou/search/api/auth'
require 'sogou/search/api/service/report'

# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

# ReportType
# 1, 2, 3, 4, 5, 6, 7
report = Service::Report.new
report.authorization = Auth.get_application_default
report_id = report.get_report_id(
  '2018-02-20T00:00:00',
  '2018-02-20T23:59:59',
  1,
  ['cost', 'cpc', 'click', 'ctr', 'position']
  )[:report_id]

state = '0'
max_try = 10
try = 0

while state != '1' && try < 10
  sleep(5)
  state = report.get_report_state(report_id)[:is_generated]
  try += 1
end

if state == '1'
  path = report.get_report_path(report_id)[:report_file_path]
  p path
else
  puts 'Timed out'
end
