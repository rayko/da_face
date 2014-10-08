module DaFace
  module Api
    class PushSubscription
      include DaFace::Utilities

      attr_accessor :name, :hash, :initial_status, :start, :end,
                    :output_params, :output_type, :playback_id

      attr_reader :id, :created_at, :user_id, :hash_type, :status, :last_request, 
                  :last_success, :remaining_bytes, :lost_data

      def initialize data={}
        assign_attributes! data
        normalize_attributes!
        return self
      end

      def assign_attributes! data
        allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
      end

      def update! data={}
        params = data.delete :output_params
        assign_attributes! data
        self.output_params.merge! params
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
        @start = (@start && @start > 0) ? parse_timestamp(@start) : nil
        @end = (@end && @end > 0) ? parse_timestamp(@end) : nil
        @created_at = parse_timestamp(@created_at) if @created_at
      end

      def generate_config
        config = {}
        config['name']           = self.name if self.name
        config['output_type']    = self.output_type if self.output_type
        config['initial_status'] = self.initial_status if self.initial_status
        config['hash']           = self.hash if self.hash
        config['playback_id']    = self.playback_id if self.playback_id
        config['start']          = self.start.to_i if self.start
        config['end']            = self.end.to_i if self.end

        config.merge! self.output_params_config if self.output_params
        config
      end

      def lost_data?
        self.lost_data
      end

      def output_params_config
        params = self.output_params.clone
        auth = params.delete :auth
        config = {}
        params.each do |key, value|
          config["output_params.#{key}"] = value
        end
        auth.each do |key, value|
          config["output_params.auth.#{key}"] = value
        end unless auth.nil?

        config
      end

      def output_config
        config = {}
        config['output_type'] = self.output_type
        config.merge! self.output_params_config

        config
      end

      def update 
        params = {'id' => self.id, 'name' => self.name}.merge(self.output_config)
        data = DaFace::Api::Push.update params
        update! data
      end

      def validate
        DaFace::Api::Push.validate self.output_config
      end

      def create
        data = DaFace::Api::Push.create self.generate_config
        return data if data.keys.include? :error
        update! data
      end
      
      def pause
        DaFace::Api::Push.pause self.id
      end
      
      def resume
        DaFace::Api::Push.resume self.id
      end

      def stop
        DaFace::Api::Push.stop self.id
      end
      
      def delete
        DaFace::Api::Push.delete self.id
      end

      def log
        data = DaFace::Api::Push.log self.id
        return data if data.keys.include? :error
        DaFace::Api::PushLog.new data
      end

      def get
        data = DaFace::Api::Push.get :id => self.id
        return data if data.keys.include? :error
        update! data
      end

      def self.get_all
        data = DaFace::Api::Push.get
        return data if data.keys.include? :error
        data[:subscriptions].collect{|d| new(d)}
      end

    end
  end
end
