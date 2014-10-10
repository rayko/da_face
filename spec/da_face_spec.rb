require 'spec_helper'

describe DaFace do
  describe '#create_subscription' do
    before do
      @attrs = {
        :output_type => "http",
        :name => "SomeName",
        :hash => "l3k4j23k4jl23j42l3k4j2l3kj4k3j4l",
        :output_params => {
          :auth => {
            :type => 'none'
          },
          :max_size => 2097152,
          :delivery_frequency => 0,
          :url => "http =>//someurl.com/someendpoint"
        },
        :start => 1412345259,
        :end => 1412375259
      }
    end

    it 'creates a PushSubscription with data' do
      obj = DaFace.create_subscription @attrs
      expect(obj.class).to eq(DaFace::Api::PushSubscription)
    end
    
    it 'creates empty PushSubscription' do
      obj = DaFace.create_subscription
      expect(obj.class).to eq(DaFace::Api::PushSubscription)
    end
  end

  describe '#parse_datasift_collection' do
    before do
      @data = fixture('interactions/collection.json')
    end

    it 'parses a collection of Datasift objects' do
      expect(Proc.new{@result = DaFace.parse_datasift_collection(@data)}).not_to raise_error
      expect(@result.class).to eq(Array)
      expect(@result.size).not_to eq(0)
    end
  end

  describe '#parse_datasift_object' do
    before do
      @data = fixture('interactions/simple.json')
    end

    it 'parses a single Datasift object' do
      expect(Proc.new{@result = DaFace.parse_datasift_object(@data)}).not_to raise_error
      expect(@result.class).to eq(DaFace::Datasift::DaObject)
    end
  end

  describe '#get_subscriptions' do
    before do
      DaFace.configure do |config|
        config.api_path_prefix = '/lolcat'
        config.api_host = 'http://host.com'
        config.user = 'lol'
        config.api_key = 'cat'
      end
      @adapter = DaFace::Api::Adapter.new
      @excon_adapter = DaFace::Api::Adapters::ExconAdapter.new
      @conn = Excon.new 'http://host.com/lolcat', :mock => true
      allow(@excon_adapter).to receive(:connection).and_return(@conn)
      allow(@adapter).to receive(:connection).and_return(@excon_adapter)
      allow(DaFace::Api::Push).to receive(:connection).and_return(@adapter)
      Excon.stub({:path => '/push/get'}, 
                 {:body => json_fixture('api_responses/get_subscriptions.json').to_json, :status => 200})
    end

    it 'fetches subscriptions' do
      expect(Proc.new{@result = DaFace.get_subscriptions}).not_to raise_error
      expect(@result.class).to eq(Array)
      expect(@result.size).not_to eq(0)
    end
  end

  describe '#reset_config' do
    before do
      DaFace.configure do |config|
        config.user = 'someone'
      end
    end

    it 'resets configuration to default' do
      DaFace.reset_config
      expect(DaFace.configuration.user).to eq(nil)
    end
  end

  describe '#configure' do
    before do
      DaFace.configure do |config|
        config.api_path_prefix = 'api'
        config.api_host = 'something'
        config.user = 'someone'
        config.api_key = 'some key'
      end
    end
    it 'sets configuration' do
      expect(DaFace.configuration.api_path_prefix).to eq('api')
      expect(DaFace.configuration.api_host).to eq('something')
      expect(DaFace.configuration.user).to eq('someone')
      expect(DaFace.configuration.api_key).to eq('some key')
    end

    it 'returns configuration' do
      obj = DaFace.configure do |config|
        config.user = 'someone'
      end

      expect(obj.class).to eq(DaFace::Configuration)
      expect(obj).to eq(DaFace.configuration)
    end
  end
end
