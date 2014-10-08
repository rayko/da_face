require 'spec_helper'

describe DaFace::Api::Adapters::Base do
  before do
    DaFace.configure do |config|
      config.api_path_prefix = '/lolcat'
      config.api_host = 'http://host.com'
      config.user = 'lol'
      config.api_key = 'cat'
    end
  end

  describe '#default_headers' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'constructs default header hash' do
      headers = @adapter.default_headers

      expect(headers.keys).to eq(['Authorization', 'Accept'])
      expect(headers.values.compact.size).not_to eq(0)
    end

    it 'constructs post header hash' do
      headers = @adapter.post_headers

      expect(headers.keys).to eq(['Authorization', 'Accept', 'Content-Type'])
      expect(headers.values.compact.size).not_to eq(0)
    end

    it 'constructs get header hash' do
      headers = @adapter.get_headers

      expect(headers.keys).to eq(['Authorization', 'Accept'])
      expect(headers.values.compact.size).not_to eq(0)
    end
  end

  describe '#host' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'uses DaFace.configuration value' do
      expect(@adapter.host).to eq(DaFace.configuration.api_host)
    end
  end

  describe '#path_prefix' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'uses DaFace.configuration value' do
      expect(@adapter.path_prefix).to eq(DaFace.configuration.api_path_prefix)
    end
  end


  describe '#user' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'uses DaFace.configuration value' do
      expect(@adapter.user).to eq(DaFace.configuration.user)
    end
  end


  describe '#api_key' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'uses DaFace.configuration value' do
      expect(@adapter.api_key).to eq(DaFace.configuration.api_key)
    end
  end

  describe '#api_path' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'constructs base path for requests' do
      expect(@adapter.api_path).to eq('http://host.com/lolcat')
    end
  end

  describe '#api_auth_header' do
    before do
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'constructs correct auth header' do
      expect(@adapter.api_auth_header).to eq('lol:cat')
    end
  end

  describe '#url_params' do
    before do
      @params = {:lol => 'lol', :cat => 'cat'}
      @adapter = DaFace::Api::Adapters::Base.new
    end

    it 'parses params hash to uri params' do
      expect(@adapter.url_params(@params)).to eq('?lol=lol&cat=cat')
    end
  end



end
