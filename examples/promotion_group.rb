require 'sogou/search/api/auth'
require 'sogou/search/api/service/plan'
require 'sogou/search/api/service/promotion_group'

#
# Set your Sogou api credentials to ENVs
#
# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

plan = Service::Plan.new
plan.authorization = Auth.get_application_default
plan_ids = plan.get_all_cpc_plan_id['cpc_plan_ids'].slice(0, 2)

group = Service::PromotionGroup.new
group.authorization = Auth.get_application_default
group.get_cpc_grp_by_cpc_plan_id(plan_ids) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

group.get_cpc_grp_id_by_cpc_plan_id(plan_ids) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

# Error
group.get_cpc_grp_by_cpc_plan_id([1, 2]) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end
