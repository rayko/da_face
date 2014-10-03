module DaFace
  module Twitter
    class Tweet
      attr_reader :id, :user, :created_at, :lang, :text, :source, :links, 
                  :retweet, :retweet_count
      
      def initialize attrs={}
        @id = attrs[:id]
        @created_at = Time.parse attrs[:created_at]
        @lang = attrs[:lang]
        @text = attrs[:text]
        @source = attrs[:source]
        @user = attrs[:user]
        @links = parse_links(attrs[:links])
        @retweet = attrs[:retweet]
        @retweet_count = attrs[:retweet_count] || 0
      end

      def retweet?
        @retweet
      end

      private
      def parse_links links
        return [] unless links
        links.collect{|l| URI(l)}
      end
    end
  end
end
