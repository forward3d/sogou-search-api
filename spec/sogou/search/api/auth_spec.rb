require "spec_helper"

include Sogou::Search::Api

RSpec.describe Auth::V1AcccountCredentials do
  let(:token) { 'xxx' }
  let(:username) { 'username' }
  let(:password) { 'passwd' }

  subject(:this) { described_class.new(token, username, password) }

  describe '#apply' do
    subject(:apply) { this.apply(hash) }

    context 'when given hash is nil' do
      let(:hash) { nil }

      it { expect(apply['v1:AuthHeader']['v1:token']).to eq(token) }
      it { expect(apply['v1:AuthHeader']['v1:username']).to eq(username) }
      it { expect(apply['v1:AuthHeader']['v1:password']).to eq(password) }
    end

    context 'when all ok' do
      let(:hash) { { 'test' => 'ok' } }

      before(:each) { apply }

      it { expect(hash['v1:AuthHeader']['v1:token']).to eq(token) }
      it { expect(hash['v1:AuthHeader']['v1:username']).to eq(username) }
      it { expect(hash['v1:AuthHeader']['v1:password']).to eq(password) }
      it { expect(hash['test']).to eq('ok') }
    end
  end
end

RSpec.describe Auth::DefaultCredentials do
  let(:token) { 'xxx' }
  let(:username) { 'username' }
  let(:password) { 'passwd' }

  describe '.from_env' do
    subject(:from_env) { described_class.from_env }

    context 'when no ENVs set' do
      before(:each) do
        ENV['SOGOU_API_TOKEN'] = nil
        ENV['SOGOU_USERNAME'] = nil
        ENV['SOGOU_PASSWORD'] = nil
      end

      it { expect(from_env.api_token).to be_nil  }
      it { expect(from_env.username).to be_nil  }
      it { expect(from_env.password).to be_nil  }
    end

    context 'when all ok' do
      before(:each) do
        ENV['SOGOU_API_TOKEN'] = token
        ENV['SOGOU_USERNAME'] = username
        ENV['SOGOU_PASSWORD'] = password
      end

      after(:each) do
        ENV['SOGOU_API_TOKEN'] = nil
        ENV['SOGOU_USERNAME'] = nil
        ENV['SOGOU_PASSWORD'] = nil
      end

      it { expect(from_env.api_token).to eq(token)  }
      it { expect(from_env.username).to eq(username)  }
      it { expect(from_env.password).to eq(password)  }
    end
  end
end
