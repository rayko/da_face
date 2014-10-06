module DaFace
  module Api
    class Push

      # Validates output_params for a subscription.
      def self.validate output_config
        response = connection.post 'push/validate', output_config
        return response
      end
      
      def self.create subcription
        response = connection.post 'push/create', subscription
        return response
      end
      
      def self.update subscription_id
        response = connection.put 'push/update', {:subscription_id => subscription_id}
        return response
      end
      
      def self.pause subscription_id
        response = connection.put 'push/pause', {:subscription_id => subscription_id}
        return response
      end
      
      def self.resume subscription_id
        response = connection.put 'push/resume', {:subscription_id => subscription_id}
        return response
      end
      
      def self.stop subscription_id
        response = connection.put 'push/stop', {:subscription_id => subscription_id}
        return response
      end
      
      def self.delete subscription_id
        response = connection.put 'push/delete', {:subscription_id => subscription_id}
        return response
      end
      
      def self.log subscription_id
        response = connection.get 'push/log', {:subscription_id => subscription_id}
        return response
      end

      def self.get params={}
        response = connection.get 'push/get', params
        response[:subscriptions].collect{|s| DaFace::Api::PushSubscription.new(s)}
      end

      def self.connection
        DaFace::Api::Adapter.new
      end
    end
  end
end
