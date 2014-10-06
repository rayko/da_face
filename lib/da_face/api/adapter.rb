module DaFace
  module Api
    class Adapter
      def post path, payload
        true
      end
      
      def get path, params={}
        response = new_connection.get :path => "#{path}#{url_params(params)}"

        response.body
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
