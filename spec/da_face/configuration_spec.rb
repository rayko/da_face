require 'spec_helper'

describe DaFace::Configuration do
  describe '#new' do
    it 'has the default values' do
      config = DaFace::Configuration.new

      expect(config.api_path_prefix).to eq('/v1')
      expect(config.api_host).to eq('http://api.datasift.com')
      expect(config.user).to eq(nil)
      expect(config.api_key).to eq(nil)
    end
  end
end
