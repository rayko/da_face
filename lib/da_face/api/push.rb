module DaFace
  module Api
    class Push
      # TODO Handle error cases in a better way (raise)
      # TODO Handle empty responses

      # Validates output_params for a subscription.
      def self.validate output_config
        response = connection.post 'push/validate', output_config
        raise_push_error_if_error response
        return response
      end
      
      def self.create subscription
        response = connection.post 'push/create', subscription
        raise_push_error_if_error response
        return response
      end
      
      def self.update subscription_id
        response = connection.put 'push/update', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end
      
      def self.pause subscription_id
        response = connection.put 'push/pause', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end
      
      def self.resume subscription_id
        response = connection.put 'push/resume', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end
      
      def self.stop subscription_id
        response = connection.put 'push/stop', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end
      
      def self.delete subscription_id
        response = connection.put 'push/delete', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end
      
      # TODO Make this work with pagination
      def self.log subscription_id
        response = connection.get 'push/log', {:id => subscription_id}
        raise_push_error_if_error response
        return response
      end

      # TODO Make this work with pagination
      def self.get params={}
        response = connection.get 'push/get', params
        raise_push_error_if_error response
        return response
      end

      def self.connection
        DaFace::Api::Adapter.new
      end

      private
      def self.raise_push_error_if_error response
        if response.keys.include? :error
          raise DaFace::PushError.new(response[:message]) if response.keys.include? :message
          raise DaFace::PushError.new(response[:error]) if response.keys.include? :error
        end
      end
    end
  end
end
