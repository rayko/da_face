module DaFace
  module Api
    class Adapter
      # Performs a get operation
      #
      # params is a level 1 hash that should contain params for url
      def get path, params={}
        response = new_connection.get :path => "#{path}#{url_params(params)}"
        return parse_json_body(response.body)
      end

      # Performs a post operation
      #
      # payload is a hash that will be parsed to json and sent as body
      def post path, payload
        true
      end
      
      # Performs a put operation
      #
      # payload is a hash that will be parsed to json and sent as body
      def put path, payload
      end

      # Transforms a level 1 hash to valid url params
      #
      # This will return something like "?something=thing" to be appended 
      # to url path
      def url_params params
        '?' + URI.encode(params.collect{ |key, value| "#{key}=#{value}"}.join('&')) unless params.empty?        
      end

      # Creates a connection with the base path and default headers
      def new_connection
        Excon.new api_path, :headers => default_headers
      end

      # Constructs the base api path for Datasift
      def api_path
        "#{config[:host]}#{config[:path_prefix]}"
      end
      
      # Constructs the auth header for Datasift
      def api_auth_header
        "#{config[:user]}:#{config[:api_key]}"
      end
      
      # Configuration for the adapter
      def config
        {
          :host => DaFace.configuration.api_host,
          :path_prefix => DaFace.configuration.api_path_prefix,
          :user => DaFace.configuration.user,
          :api_key => DaFace.configuration.api_key
        }
      end

      # Parses a json body and sybmolizes the hash returned
      def parse_json_body body
        parsed_body = JSON.parse(body)
        return symbolize_keys(parsed_body.keys, parsed_body)
      end

      # Creates a new hash with all keys as symbols, can be
      # any level of depth
      def symbolize_keys keys, hash
        new_hash = {}
        keys.each do |key|
          if hash[key].kind_of? Hash
            new_hash[key.to_sym] = symbolize_keys(hash[key].keys, hash[key])
          else
            new_hash[key.to_sym] = hash[key]
          end
        end

        return new_hash
      end
      
      # Constructs default headers for operations
      def default_headers
        {
          :authorization => api_auth_header,
          :content_type => :json,
          :accept => :json
        }
      end
    end
  end
end
