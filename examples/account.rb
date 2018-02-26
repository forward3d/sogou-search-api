
require 'sogou/search/api/auth'
require 'sogou/search/api/service/account'
require 'sogou/search/api/service/plan'
require 'sogou/search/api/service/promotion_group'
require 'sogou/search/api/service/keyword'
require 'sogou/search/api/service/report'

# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

account = Service::Account.new
account.authorization = Auth.get_application_default
account.get_account_info do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

# plan = Service::Plan.new
# plan.authorization = Auth.get_application_default
# #p plan.get_all_cpc_plan
# plan_ids = plan.get_all_cpc_plan_id[:get_all_cpc_plan_id_response][:cpc_plan_ids]
# p plan_ids
#
# group = Service::PromotionGroup.new
# group.authorization = Auth.get_application_default
# #p group.get_cpc_grp_by_cpc_plan(plan_ids.slice(0, 2))
# grp_ids = group.get_cpc_grp_id_by_cpc_plan_id(plan_ids.slice(0, 2))[:get_cpc_grp_id_by_cpc_plan_id_response][:cpc_plan_grp_ids]
# p grp_ids
# #
# k = Service::Keyword.new
# k.authorization = Auth.get_application_default
# p k.get_cpc_by_cpc_grp_id(grp_ids.map { |id| id[:cpc_grp_ids] }.flatten.slice(0, 2))
#
# # ReportType
# # 1, 2, 3, 4, 5, 6, 7
# r = Service::Report.new
# r.authorization = Auth.get_application_default
# #report_id = r.get_report_id('2018-02-20T00:00:00', '2018-02-20T23:59:59', 1, ['cost', 'cpc', 'click', 'ctr', 'position'])
# report_id = r.get_report_id('2018-02-20T00:00:00', '2018-02-20T23:59:59', 1, %w[cost cpc click impression ctr])[:get_report_id_response][:report_id]
# p report_id
# sleep(5)
# state = r.get_report_state(report_id)[:get_report_state_response][:is_generated]
# p state
# if state == '1'
  # path = r.get_report_path(report_id)[:get_report_path_response][:report_file_path]
  # p path
# end
