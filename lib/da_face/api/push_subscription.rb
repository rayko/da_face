module DaFace
  module Api
    class PushSubscription
      include DaFace::Utilities

      attr_accessor :name, :hash, :initial_status, :start, :end,
                    :output_params, :output_type, :playback_id

      attr_reader :id, :created_at, :user_id, :hash_type, :status, :last_request, 
                  :last_success, :remaining_bytes, :lost_data

      def initialize data={}
        allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
        normalize_attributes!
        return self
      end

      def allowed_attributes
        [:name, :hash, :initial_status, :start, :end,
         :output_params, :output_type, :playback_id,
         :id, :created_at, :user_id, :hash_type, :status, :last_request, 
         :last_success, :remaining_bytes, :lost_data]
      end

      def normalize_attributes!
        @last_request = parse_timestamp(@last_request) if @last_request
        @last_success = parse_timestamp(@last_success) if @last_success
        @start = parse_timestamp(@start) if @start
        @end = parse_timestamp(@end) if @end
        @created_at = parse_timestamp(@created_at) if @created_at
      end

      def generate_config
        config = {}
        config[:name]           = self.name if self.name
        config[:output_type]    = self.output_type if self.output_type
        config[:initial_status] = self.initial_status if self.initial_status
        config[:hash]           = self.hash if self.hash
        config[:playback_id]    = self.playback_id if self.playback_id
        config[:start]          = self.start.to_i if self.start
        config[:end]            = self.end.to_i if self.end
        config[:output_params]  = self.output_params_config if self.output_params

        config
      end

      def lost_data?
        self.lost_data
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
