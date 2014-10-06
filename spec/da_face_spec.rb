require 'spec_helper'

describe DaFace do
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
  end
end
