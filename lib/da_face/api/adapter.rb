module DaFace
  module Api
    class Adapter
      def get path, params={}
        response = new_connection.get :path => "#{path}#{url_params(params)}"
        response.body
      end

      def post path, payload
        true
      end
      
      def put path, payload
      end

      def url_params params
        '?' + URI.encode(params.collect{ |key, value| "#{key}=#{value}"}.join('&')) unless params.empty?        
      end

      def new_connection
        Excon.new api_path, :headers => default_headers
      end

      def api_path
        "#{config[:host]}#{config[:path_prefix]}"
      end
      
      def api_auth_header
        "#{config[:user]}:#{config[:api_key]}"
      end
      
      def config
        {
          :host => DaFace.configuration.api_host,
          :path_prefix => DaFace.configuration.api_path_prefix,
          :user => DaFace.configuration.user,
          :api_key => DaFace.configuration.api_key
        }
      end

      def parse_json_body body
        parsed_body = JSON.parse(body)

        return symbolize_keys(parsed_body.keys, parsed_body)
      end

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
