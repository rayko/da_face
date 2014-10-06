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

  describe '#symbolize_keys' do
    before do
      @hash = {'key1' => '1', 'key2' => [{'key3' => '3'}, {'key7' => '7'}], 'key4' => {'key5' => {'key6' => '6'}}}
      @adapter = DaFace::Api::Adapter.new
    end

    it 'converts hash keys to symbols even in depth' do
      expect(@adapter.symbolize_keys(@hash.keys, @hash)).to eq({:key1 => '1', :key2 => [{:key3 => '3'}, {:key7 => '7'}], :key4 => {:key5 => {:key6 => '6'}}})
    end
  end

  describe '#parse_json_body' do
    before do
      @json = {:lolcat => 'madcat'}.to_json
      @adapter = DaFace::Api::Adapter.new
    end

    it 'parses json response' do
      expect(@adapter.parse_json_body(@json)).to eq({:lolcat => 'madcat'})
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
end
