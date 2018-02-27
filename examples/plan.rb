require 'sogou/search/api/auth'
require 'sogou/search/api/service/plan'

# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

plan = Service::Plan.new
plan.authorization = Auth.get_application_default
plan.get_all_cpc_plan do |result, err|
  if err != nil
    p err
  else
    p result
  end
end

plan.get_all_cpc_plan_id do |result, err|
  if err != nil
    p err
  else
    p result
  end
end
