require "spec_helper"

RSpec.describe Sogou::Search::Api do
  describe '.logger' do
    subject(:logger) { described_class.logger }
    before(:each) do
      described_class.send(:logger=, nil)
    end

    context 'when Rails.logger defined' do
      module Rails
        def self.logger
          'rails_logger'
        end
      end

      it { expect(logger).to eq('rails_logger') }
    end

    context 'when Rails.logger not defined' do
      before(:each) do
        Object.send(:remove_const, :Rails)
      end

      it { expect(logger).to be_a_kind_of(::Logger) }
    end
  end
end
