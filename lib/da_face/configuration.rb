module DaFace
  class Configuration
    attr_accessor :api_path_prefix, :api_host, :user, :api_key

    def initialize
      @api_path_prefix = '/v1'
      @api_host = 'http://api.datasift.com'
    end
  end
end
