require 'spec_helper' 

describe DaFace::Api::Push do
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
  end

  describe '.get' do
    before do
      Excon.stub({:path => '/push/get'}, 
                 {:body => json_fixture('api_responses/get_subscriptions.json').to_json, :status => 200})
    end

    it 'returns subscription list' do
      data = DaFace::Api::Push.get
      expect(data).not_to eq(nil)
      expect(data.class).to eq(Hash)
    end
  end

  describe '.log' do
    before do
      Excon.stub({:path => '/push/log?id=some_sub_id'}, 
                 {:body => json_fixture('api_responses/log.json').to_json, :status => 200})
    end

    it 'returns a log list' do
      data = DaFace::Api::Push.log 'some_sub_id'
      expect(data).not_to eq(nil)
      expect(data[:log_entries].size).not_to eq(0)
    end
  end

  describe '.stop' do
    before do
      Excon.stub({:path => '/push/stop'}, 
                 {:status => 200})
    end

    it 'returns true when stopping' do
      data = DaFace::Api::Push.stop 'some_sub_id'
      expect(data).not_to eq(nil)
      expect(data).to eq(true)
    end
  end

  describe '.pause' do
    before do
      Excon.stub({:path => '/push/pause'}, 
                 {:status => 200})
    end

    it 'returns true when pausing' do
      data = DaFace::Api::Push.pause 'some_sub_id'
      expect(data).not_to eq(nil)
      expect(data).to eq(true)
    end
  end

  describe '.resume' do
    before do
      Excon.stub({:path => '/push/resume'}, 
                 {:status => 200})
    end

    it 'returns true when resuming' do
      data = DaFace::Api::Push.resume 'some_sub_id'
      expect(data).not_to eq(nil)
      expect(data).to eq(true)
    end
  end

  describe '.validate' do
    before do
      Excon.stub({:path => '/push/validate'}, 
                 {:body => json_fixture('api_responses/validate_success.json').to_json, :status => 200})
    end

    it 'validates output_params' do
      data = DaFace::Api::Push.validate :some_output => 'output'
      expect(data).not_to eq(nil)
      expect(data[:message]).to eq('Validated successfully')
    end
  end

  describe '.create' do
    before do
      Excon.stub({:path => '/push/create'}, 
                 {:status => 200})
    end

    it 'creates a subscription in datasift' do
      data = DaFace::Api::Push.create :some_sub => 'data'
      expect(data).not_to eq(nil)
    end
  end
end
