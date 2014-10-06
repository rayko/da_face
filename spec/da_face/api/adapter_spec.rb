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
      @hash = {'key1' => '1', 'key2' => {'key3' => '3'}, 'key4' => {'key5' => {'key6' => '6'}}}
      @adapter = DaFace::Api::Adapter.new
    end

    it 'converts hash keys to symbols even in depth' do
      expect(@adapter.symbolize_keys(@hash.keys, @hash)).to eq({:key1 => '1', :key2 => {:key3 => '3'}, :key4 => {:key5 => {:key6 => '6'}}})
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

  describe '#default_headers' do
    before do
      @adapter = DaFace::Api::Adapter.new
    end

    it 'constructs default header hash' do
      headers = @adapter.default_headers

      expect(headers.keys).to eq([:authorization, :content_type, :accept])
      expect(headers.values.compact.size).not_to eq(0)
    end
  end

  describe '#url_params' do
    before do
      @params = {:lol => 'lol', :cat => 'cat'}
      @adapter = DaFace::Api::Adapter.new
    end

    it 'parses params hash to uri params' do
      expect(@adapter.url_params(@params)).to eq('?lol=lol&cat=cat')
    end
  end

  describe '#config' do
    before do
      @adapter = DaFace::Api::Adapter.new
      @config_hash = {:host => 'http://host.com', :path_prefix => '/lolcat', :user => 'lol', :api_key => 'cat'}
    end

    it 'constructs a config hash' do
      expect(@adapter.config).to eq(@config_hash)
    end
  end

  describe '#api_path' do
    before do
      @adapter = DaFace::Api::Adapter.new
    end

    it 'constructs base path for requests' do
      expect(@adapter.api_path).to eq('http://host.com/lolcat')
    end
  end

  describe '#api_auth_header' do
    before do
      @adapter = DaFace::Api::Adapter.new
    end

    it 'constructs correct auth header' do
      expect(@adapter.api_auth_header).to eq('lol:cat')
    end
  end
  
  describe '#get' do
    before do
      @adapter = DaFace::Api::Adapter.new
      Excon.stub({}, {:body => {'OK' => true}, :status => 200})
      @conn = Excon.new 'http://something.com', :mock => true
      allow(@adapter).to receive(:new_connection).and_return(@conn)
    end

    it 'performs a get' do
      expect(@adapter.get('something')).to eq({'OK' => true})
    end
  end
end
