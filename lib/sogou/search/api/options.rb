module Sogou
  module Search
    module Api
      ClientOptions = Struct.new(
        :proxy_url,
        :open_timeout_sec,
        :read_timeout_sec,
      )

      class ClientOptions
        def self.default
          @options ||= ClientOptions.new
        end
      end
    end
  end
end
