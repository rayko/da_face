require 'spec_helper'

describe DaFace::Api::Adapter do
  before do
    DaFace.configure do |config|
      config.api_path_prefix = '/lolcat'
      config.api_host = 'http://host.com'
      config.user = 'lol'
      config.api_key = 'cat'
    end
  end

  describe '#get' do
    before do
      @adapter = DaFace::Api::Adapter.new
      @excon_adapter = DaFace::Api::Adapters::ExconAdapter.new
      @conn = Excon.new 'http://something.com', :mock => true
      Excon.stub({}, {:body => {'ok' => true}.to_json, :status => 200})
      allow(@excon_adapter).to receive(:connection).and_return(@conn)
      allow(@adapter).to receive(:connection).and_return(@excon_adapter)
    end

    it 'performs a get' do
      expect(@adapter.get('thing')).to eq({:ok => true})
    end
  end

  describe '#put' do
    before do
      @adapter = DaFace::Api::Adapter.new
      @excon_adapter = DaFace::Api::Adapters::ExconAdapter.new
      @conn = Excon.new 'http://something.com/post', :mock => true
      Excon.stub({}, {:status => 200})
      allow(@excon_adapter).to receive(:connection).and_return(@conn)
      allow(@adapter).to receive(:connection).and_return(@excon_adapter)
    end

    it 'performs a post' do
      expect(@adapter.put('thing', {:something => 1})).to eq(true)
    end
  end

  describe '#post' do
    before do
      @adapter = DaFace::Api::Adapter.new
      @excon_adapter = DaFace::Api::Adapters::ExconAdapter.new
      @conn = Excon.new 'http://something.com', :mock => true
      Excon.stub({}, {:status => 200})
      allow(@excon_adapter).to receive(:connection).and_return(@conn)
      allow(@adapter).to receive(:connection).and_return(@excon_adapter)
    end

    it 'performs a put' do
      expect(@adapter.post('thing', {:something => 1})).to eq(true)
    end
  end

end
