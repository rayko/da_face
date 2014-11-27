module DaFace
  module Api
    class RateLimitStatus
      attr_reader :limit, :remaining
      
      def initialize attrs={}
        @rate_limit = attrs[:limit]
        @remaining_credits = attrs[:remaining]
      end
      
    end
  end
end
