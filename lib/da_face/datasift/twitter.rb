module DaFace
  module Datasift
    class Twitter
      include DaFace::Utilities
      
      attr_accessor :retweet, :retweeted, :tweet, :status

      def self.new data
        if data[:status]
          return DaFace::Datasift::TwitterUserStatus.new(data)        
        else
          super
        end
      end

      def initialize data
        if data.keys.include? :retweet
          @retweet = DaFace::Twitter::Parser.parse data[:retweet], true
          @retweeted = DaFace::Twitter::Parser.parse data[:retweeted], false
        else
          @tweet = DaFace::Twitter::Parser.parse data, false
        end
      end

    end
  end
end
