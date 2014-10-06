module DaFace
  module Api
    class Adapter
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
          elsif hash[key].kind_of? Array
            new_hash[key.to_sym] = []
            hash[key].each do |h|
              new_hash[key.to_sym] << symbolize_keys(h.keys, h)
            end
          else
            new_hash[key.to_sym] = hash[key]
          end
        end

        return new_hash
      end
      
    end
  end
end
