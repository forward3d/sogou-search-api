require 'sogou/search/api/auth'
require 'sogou/search/api/service/report'

#
# Set your Sogou api credentials to ENVs
#
# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

report = Service::Report.new
report.authorization = Auth.get_application_default

request = Service::ReportRequest.default.dup
request.fields = %w[cost cpc click ctr impression position]
request.start_date = '2018-02-20T00:00:00'
request.end_date = '2018-02-20T23:59:59'
request.type = 2
request.platform = 2

report_id = report.get_report_id(request)

state = '0'
max_try = 10
try = 0

while state != '1' && try < 10
  sleep(5)
  state = report.get_report_state(report_id)
  try += 1
end

if state == '1'
  path = report.get_report_path(report_id)
  p path
else
  puts 'Timed out'
end
