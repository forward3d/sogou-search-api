require 'sogou/search/api/version'
require 'logger'

module Sogou
  module Search
    module Api
      ROOT = File.expand_path('..', File.dirname(__dir__))

      def self.logger
        @logger ||= (rails_logger || default_logger)
      end

      class << self
        attr_writer :logger
      end

      private

      def self.default_logger
        logger = Logger.new(STDOUT)
        logger.level = Logger::DEBUG
        logger
      end

      def self.rails_logger
        if defined?(::Rails) && ::Rails.respond_to?(:logger) &&
          !::Rails.logger.nil?
          ::Rails.logger
        else
          nil
        end
      end
    end
  end
end
