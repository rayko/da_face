module DaFace
  module Api
    module Adapters
      class Base
        attr_reader :host, :path_prefix, :user, :api_key

        def initialize
          @host = DaFace.configuration.api_host
          @path_prefix = DaFace.configuration.api_path_prefix
          @user = DaFace.configuration.user
          @api_key = DaFace.configuration.api_key
        end

        # Constructs default headers for operations
        def default_headers
          {
            :authorization => api_auth_header,
            :content_type => :json,
            :accept => :json
          }
        end

        # Constructs the base api path for Datasift
        def api_path
          "#{self.host}#{self.path_prefix}"
        end
        
        # Constructs the auth header for Datasift
        def api_auth_header
          "#{self.user}:#{self.api_key}"
        end
        
        # Transforms a level 1 hash to valid url params
        #
        # This will return something like "?something=thing" to be appended 
        # to url path
        def url_params params
          '?' + URI.encode(params.collect{ |key, value| "#{key}=#{value}"}.join('&')) unless params.empty?        
        end


      end
    end
  end
end
