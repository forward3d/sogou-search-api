require 'sogou/search/api/auth'
require 'sogou/search/api/service/account'
require 'sogou/search/api/service/plan'

#
# Set your Sogou api credentials to ENVs
#
# ENV['SOGOU_API_TOKEN'] = 'xxxx'
# ENV['SOGOU_USERNAME'] = 'xxxx'
# ENV['SOGOU_PASSWORD'] = 'xxxx'

include Sogou::Search::Api

account = Service::Account.new
account.authorization = Auth.get_application_default
account.get_account_info(options: {convert_regions_to_string: true}) do |result, err|
  if err != nil
    p err
  else
    p result
  end
end
