module DaFace
  module Twitter
    class Parser
      extend DaFace::Utilities
      
      def self.parse data, retweet=false
        parsed_data = symbolize_keys(data.keys, data)

        user = DaFace::Twitter::User.new parsed_data[:user]
        tweet = DaFace::Twitter::Tweet.new parsed_data.merge({:user => user, :retweet => retweet})
        return tweet
      end

    end
  end
end
