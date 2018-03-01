require 'spec_helper'

include Sogou::Search::Api

describe Core::BaseService do
  subject(:this) { described_class.new(service) }
  let(:service) { 'foo' }

  describe '#make_command' do
    subject(:make_command) { this.send(:make_command, :test, params: { foo: 'bar' })}

    it { expect(make_command.params).to eq({ foo: 'bar' }) }
    it { expect(make_command.options).to eq({}) }
  end

  describe '#execute_command' do
    subject(:execute_command) { this.send(:execute_command, command) }
    let(:command) { double('command') }

    it 'calls command.execute once' do
      expect(command).to receive(:execute).once
      execute_command
    end
  end

  describe '#client' do
    subject(:client) { this.send(:client) }
    context 'without options' do
      it { expect(client).to be_a_kind_of(Savon::Client) }

      context ', no authorization' do
        it { expect(client.globals[:soap_header]).to eq({}) }
      end

      context ', with authorization' do
        before(:each) { this.authorization = Auth.get_application_default }
        it { expect(client.globals[:soap_header]).to eq({"v1:AuthHeader"=>{"v1:username"=>nil, "v1:password"=>nil, "v1:token"=>nil}}) }
      end
    end

    context 'with options' do
      before(:each) do
        client_options = ClientOptions.default
        client_options.read_timeout_sec = 60
        client_options.open_timeout_sec = 180
        client_options.proxy_url = 'https://proxy.foo.com'
        this.client_options = client_options
      end

      it { expect(client).to be_a_kind_of(Savon::Client) }
      it { expect(client.globals[:open_timeout]).to eq(180) }
      it { expect(client.globals[:read_timeout]).to eq(60) }
      it { expect(client.globals[:proxy]).to eq('https://proxy.foo.com') }
    end
  end

  describe '#service_host' do
    subject(:service_host) { this.send(:service_host) }

    context 'when ENV => development' do
      before(:each) { ENV['ENV'] = 'development' }

      it { expect(service_host).to eq('api.agent.sogou.com:8080') }
    end

    context 'when ENV => production' do
      before(:each) { ENV['ENV'] = 'production' }

      it { expect(service_host).to eq('api.agent.sogou.com') }
    end
  end
end
