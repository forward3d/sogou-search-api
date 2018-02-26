require 'sogou/search/api'

module Sogou
  module Search
    module Api
      module Core
        module Logging
          def logger
            Sogou::Search::Api.logger
          end
        end
      end
    end
  end
end
