require 'spec_helper'

include Sogou::Search::Api

describe Core::ApiCommand do
  subject(:this) { described_class.new(operation) }

  describe '#execute' do
    subject(:execute) { this.execute(client) }
    let(:operation) { :test }
    let(:client) { double('client') }

    context 'when all ok' do
      context 'with block' do
        it { execute }
      end

      context 'without block' do
      end
    end

    context 'when error occurrs' do
      context 'with block' do
      end

      context 'without block' do
      end
    end
  end

  describe '#process_response' do
    context 'when success response' do
    end

    context 'when failure response' do
    end
  end

  describe '#check_error_code' do
    context 'when given error contains single error' do
      context 'with raise_error true' do
      end

      context 'with raise_error false' do
      end
    end

    context 'when given error contains multiple errors' do
      context 'with raise_error true' do
      end

      context 'with raise_error false' do
      end
    end
  end
end
