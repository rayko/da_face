module DaFace
  module Api
    class PushLog
      attr_reader :count, :entries
      def initialize data
        @count = data[:count]
        @entries = data[:log_entries].collect{|e| DaFace::Api::PushLogEntry.new(e)}
      end
    end
  end
end
