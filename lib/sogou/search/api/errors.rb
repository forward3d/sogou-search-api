module Sogou
  module Search
    module Api
      class Error < StandardError
        attr_reader :code
        attr_reader :message
        attr_reader :header

        def initialize(err, code: nil, header: nil)
          @cause = nil

          if err.respond_to?(:backtrace)
            super(err.message)
            @cause = err
          else
            super(err.to_s)
          end
          @code = code
          @header = header unless header.nil?
        end

        def backtrace
          if @cause
            @cause.backtrace
          else
            super
          end
        end
      end # Error

      InvalidTokenError = Class.new(Error)

      InvalidUserNameError = Class.new(Error)

      WrongPasswordError = Class.new(Error)

      RateLimitError = Class.new(Error)

      UnknownError = Class.new(Error)

      TransmissionError = Class.new(Error)

      PlanIDNotExistError = Class.new(Error)

      PromotionGroupIDNotExistError = Class.new(Error)

      KeywordIDNotExistError = Class.new(Error)
    end
  end
end
