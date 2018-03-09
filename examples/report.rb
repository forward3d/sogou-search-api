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
report_id = report.get_report_id(
  '2018-02-20T00:00:00',
  '2018-02-20T23:59:59',
  2,
  ['cost', 'cpc', 'click', 'ctr', 'impression', 'position'],
  platform: 2
  )

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
