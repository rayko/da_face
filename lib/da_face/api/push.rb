module DaFace
  module Api
    class Push

      # Validates output_params for a subscription.
      def self.validate output_config
        response = connection.post 'somepath', output_config
        
        response
      end
      
      def self.create
      end
      
      def self.update
      end
      
      def self.pause
      end
      
      def self.resume
      end
      
      def self.stop
      end
      
      def self.delete
      end
      
      def self.log
      end

      def self.get
      end

      private
      def self.connection
        DaFace::Api::Adapter.new
      end

      
    end
  end
end
