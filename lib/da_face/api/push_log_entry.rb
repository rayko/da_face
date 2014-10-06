module DaFace
  module Api
    class PushLogEntry
      attr_reader :request_time, :success, :subscription_id, :message

      def initialize data
        @request_time = Time.at data[:request_time]
        @sucess = data[:success]
        @subscription_id = data[:subscription_id]
        @message = data[:message]
      end
    end
    
  end
end
