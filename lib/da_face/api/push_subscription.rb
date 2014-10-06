module DaFace
  module Api
    class PushSubscription
      attr_accessor :name, :hash, :initial_status, :start, :end,
                    :output_params, :output_type, :playback_id

      attr_reader :id, :created_at, :user_id, :hash_type, :status, :last_request, 
                  :last_success, :remaining_bytes, :lost_data

      def initialize attrs
        @id = attrs[:id]
        @user_id = attrs[:user_id]
        @hash_type = attrs[:hash_type]
        @status = attrs[:status]
        @last_request = attrs[:last_request]
        @last_success = attrs[:last_success]
        @remaining_bytes = attrs[:remaining_bytes]
        @lost_data = attrs[:lost_data]
        @name = attrs[:name]
        @hash = attrs[:hash]
        @initial_status = attrs[:initial_status]
        @start = attrs[:start]
        @end = attrs[:end]
        @hash_type = attrs[:hash_type]
        @playback_id = attrs[:playback_id]
        @created_at = attrs[:created_at]
        @output_params = attrs[:output_params]
        @output_type = attrs[:output_type]
      end

      def generate_config
        config = {}
        attrs = [:name, :output_type, :initial_status, :hash, :playback_id, :start, :end]
        attrs.each do |attr|
          value = self.send(attr)
          config[attr] = value if value
        end
        config[:output_params] = self.output_params_config
        
        config
      end

      def output_params_config
        self.output_params
      end

      def output_config
        config = {}
        config[:output_type] = self.output_type
        config[:output_params] = self.output_params_config

        config
      end

      def validate
        DaFace::Api::Push.validate self.output_config
      end

    end
  end
end
