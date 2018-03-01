require 'spec_helper'

include Sogou::Search::Api

describe Core::ApiCommand do
  subject(:this) { described_class.new(operation) }
  let(:operation) { :test }

  describe '#execute' do
    subject(:execute) { this.execute(client) }
    let(:client) { double('client') }
    before(:each) do
      allow(client).to receive(:call) {  }
    end

    context 'when all ok' do
      let(:result) { 'result' }
      before(:each) do
        allow(this).to receive(:process_response) { result }
      end

      context 'with block' do
        it 'yields result and error nil' do
          expect { |b| this.execute(client, &b) }
            .to yield_with_args(result, nil)
        end
      end

      context 'without block' do
        it { expect(execute).to eq(result) }
      end
    end

    context 'when error occurrs' do
      before(:each) do
        allow(this).to receive(:process_response) { raise UnknownError.new('error') }
      end

      context 'with block' do
        it 'yields result and error nil' do
          expect { |b| this.execute(client, &b) }
            .to yield_with_args(nil, UnknownError)
        end
      end

      context 'without block' do
        it { expect { execute }.to raise_error(UnknownError) }
      end
    end
  end

  describe '#process_response' do
    subject(:process_response) { this.process_response(response) }

    context 'when success response' do
      let(:result) { 'test' }
      let(:response) do
        double(
          'response',
          header: { 'res_header' => { 'desc' => 'success' } },
          body: { "#{operation}_response" => result }
          )
      end

      it 'returns relevant body' do
        expect(process_response).to eq(result)
      end
    end

    context 'when failure response' do
      let(:failure_header) { 'failure header' }
      let(:response) do
        double(
          'response',
          header: {
            'res_header' => {
              'desc' => 'failure',
              'failures' => failure_header
            }
          })
      end

      it 'calls check_error_code to check errors' do
        expect(this).to receive(:check_error_code).with(failure_header)
        process_response
      end
    end
  end

  describe '#check_error_code' do
    subject(:check_error_code) { this.check_error_code(header, raise?) }

    context 'when given error contains single error' do
      let(:header) { { 'code' => code, 'message' => 'something happened' } }

      context 'with raise_error true' do
        let(:raise?) { true }

        context ', code 6' do
          let(:code) { 6 }
          it { expect{ check_error_code }.to raise_error(InvalidUserNameError) }
        end

        context ', code 8' do
          let(:code) { 8 }
          it { expect{ check_error_code }.to raise_error(WrongPasswordError) }
        end

        context ', code 10' do
          let(:code) { 10 }
          it { expect{ check_error_code }.to raise_error(InvalidTokenError) }
        end

        context ', code 18' do
          let(:code) { 18 }
          it { expect{ check_error_code }.to raise_error(RateLimitError) }
        end

        context ', code 1000011' do
          let(:code) { 1000011 }
          it { expect{ check_error_code }.to raise_error(PlanIDNotExistError) }
        end

        context ', code 1000012' do
          let(:code) { 1000012 }
          it { expect{ check_error_code }.to raise_error(PromotionGroupIDNotExistError) }
        end

        context ', code 1000013' do
          let(:code) { 1000013 }
          it { expect{ check_error_code }.to raise_error(KeywordIDNotExistError) }
        end

        context ', unknown code' do
          let(:code) { 9999999 }
          it { expect{ check_error_code }.to raise_error(UnknownError) }
        end
      end

      context 'with raise_error false' do
        let(:raise?) { false }
        let(:code) { 6 }

        it { expect(check_error_code).to be_a_kind_of(InvalidUserNameError) }
      end
    end

    context 'when given error contains multiple errors' do
      let(:header) do
        [
          { 'code' => 6, 'message' => 'something happened' },
          { 'code' => 8, 'message' => 'something happened' }
        ]
      end

      context 'with raise_error true' do
        let(:raise?) { true }

        it 'raises first error only' do
          expect{ check_error_code }.to raise_error(InvalidUserNameError)
        end
      end

      context 'with raise_error false' do
        let(:raise?) { false }

        it 'returns first error only' do
          expect(check_error_code).to be_a_kind_of(InvalidUserNameError)
        end
      end
    end
  end

  describe '#error' do
    subject(:error) { this.send(:error, err) }

    context 'when network error happened' do
      context 'with SocketError' do
        let(:err) { SocketError.new }

        it { expect{ error }.to raise_error(TransmissionError) }
      end

      context 'with Net::ReadTimeout' do
        let(:err) { Net::ReadTimeout.new }

        it { expect{ error }.to raise_error(TransmissionError) }
      end
    end

    context 'when multiple errors' do
      let(:err) do
        double('error', header: [
          { 'code' => 6, 'message' => 'something happened' },
          { 'code' => 8, 'message' => 'something happened' }]
        )
      end

      it 'returns all errors' do
        expect { |b| this.send(:error, err, &b) }
            .to yield_with_args(
              nil, [
                InvalidUserNameError.new('something happened'),
                WrongPasswordError.new('something happened')
              ])
      end
    end
  end
end
