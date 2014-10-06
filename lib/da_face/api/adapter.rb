module DaFace
  module Api
    class Adapter
      def post path, payload
        true
      end
      
      def get path, params
        
      end

      def put path, payload
      end

      # private
      def new_connection
        Excon.new
      end
      
      def config
        {
          :path_prefix => DaFace.configuration.api_path_prefix,
          :user => DaFace.configuration.user,
          :api_key => DaFace.configuration.api_key
        }
      end
      
      def default_headers

      end
    end
  end
end
