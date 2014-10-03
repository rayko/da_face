module DaFace
  module Datasift
    class Twitter
      attr_accessor :retweet, :retweeted, :tweet

      def initialize data
        if data.keys.include? 'retweet'
          self.retweet = DaFace::Twitter::Parser.parse data['retweet'], true
          self.retweeted = DaFace::Twitter::Parser.parse data['retweeted'], false
        else
          self.tweet = DaFace::Twitter::Parser.parse data, false
        end
      end
    end
  end
end
