require 'sogou/search/api/auth'
require 'sogou/search/api/service/plan'
require 'sogou/search/api/service/group'
require 'sogou/search/api/service/keyword'

#
# Set your Sogou api credentials to ENVs
#
# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

plan = Service::Plan.new
plan.authorization = Auth.get_application_default
plan_ids = plan.get_all_cpc_plan_id.slice(0, 2)

group = Service::Group.new
group.authorization = Auth.get_application_default
group_ids = group.get_cpc_grp_id_by_cpc_plan_id(plan_ids).
              map { |id| id['cpc_grp_ids'] }.flatten.slice(0, 2)

keyword = Service::Keyword.new
keyword.authorization = Auth.get_application_default
keyword.get_cpc_by_cpc_grp_id(group_ids) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

keyword.get_cpc_id_by_cpc_grp_id(group_ids) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end
