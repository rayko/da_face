module DaFace
  module Api
    class Adapter
      include DaFace::Utilities

      # TODO Handle headers for rate limits
      # TODO Handle status codes

      # Performs a get operation
      #
      # params is a level 1 hash that should contain params for url
      def get path, params={}
        response = connection.get path, params
        return symbolize_keys(response.keys, response)
      end

      # Performs a post operation
      #
      # payload is a hash that will be parsed to json and sent as body
      def post path, payload
        response = connection.post path, payload
        return true if response.empty?
        return symbolize_keys(response.keys, response)
      end
      
      # Performs a put operation
      #
      # payload is a hash that will be parsed to json and sent as body
      def put path, payload
        response = connection.put path, payload
        return true if response.empty?
        return symbolize_keys(response.keys, response)
      end

      # Creates a connection with the base path and default headers
      def connection
        DaFace.configuration.adapter_class.new
      end
    end
  end
end
