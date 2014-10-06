module DaFace
  module Api
    class Push
      attr_accessor :name, :hash, :initial_status, :start, :end,
                    :hash_type, :connector, :playback_id

      attr_reader :id, :created_at, :user_id, :hash_type, :status, ,:last_request, 
                  :last_success, :remaining_bytes, :lost_data

      def initialize attrs
        @id = attrs[:id]
        @user_id = attrs[:user_id]
        @hash_type = attrs[:hash_type]
        @status = attrs[:status]
        @last_request = attrs[:last_request]
        @remaining_bytes = attrs[:remaining_bytes]
        @lost_data = attrs[:lost_data]
        @name = attrs[:name]
        @hash = attrs[:hash]
        @initial_status = attrs[:initial_status]
        @start = attrs[:start]
        @end = attrs[:end]
        @hash_type = attrs[:hash_type]
        @playback_id = attrs[:playback_id]

        @connector = DaFace::Api::ConnectorBuilder.new attrs.slice(:output_type, :output_params)
      end

      def validate
      end
      
      def create_subscription
      end
      
      def update_subscrition
      end
      
      def pause_subscription
      end
      
      def resume_subscription
      end
      
      def stop_sbscription
      end
      
      def delete_subscription
      end
      
      def get_log
      end

      def list_subscriptions
      end

      
    end
  end
end
