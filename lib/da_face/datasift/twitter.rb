module DaFace
  module Datasift
    class Twitter
      attr_accessor :retweet, :retweeted, :tweet

      def initialize data
        if data.keys.include? 'retweet'
          self.retweet = DaFace::Twitter::Tweet.new data['retweet']
          self.retweeted = DaFace::Twitter::Tweet.new data['retweeted']
        else
          self.tweet = DaFace::Twitter::Tweet.new data
        end
      end
    end
  end
end
