module DaFace
  module Datasift
    class Twitter
      include DaFace::Utilities
      
      attr_reader :retweet, :retweeted, :tweet, :status

      def self.new data
        if data[:status]
          return DaFace::Datasift::TwitterUserStatus.new(data)        
        else
          super
        end
      end

      def initialize data
        if data.keys.include? :retweet
          @tweet = DaFace::Twitter::Parser.parse extract_retweet_info(data), true
          @retweeted = DaFace::Twitter::Parser.parse extract_tweet_info(data), false
          @retweet = true
        else
          @tweet = DaFace::Twitter::Parser.parse extract_tweet_info(data), false
          @retweet = false
        end
      end

      def retweet?
        @retweet
      end

      private
      def extract_retweet_info data
        data[:retweet]
      end

      def extract_tweet_info data
        if data[:retweet]
          data[:retweeted].merge({:text => (data[:retweeted][:text] || data[:retweet][:text])})
        else
          data
        end
      end

    end
  end
end
