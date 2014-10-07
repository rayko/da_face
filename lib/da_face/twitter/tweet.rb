module DaFace
  module Twitter
    class Tweet
      include DaFace::Utilities

      attr_reader :id, :user, :created_at, :lang, :text, :source, :links, 
                  :retweet, :retweet_count
      
      def initialize data={}
        allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
        normalize_attributes!
        return self
      end

      def retweet?
        @retweet || false
      end

      def retweet_count
        @retweet_count || 0
      end

      def id_str
        @id.to_s
      end

      def normalize_attributes!
        @created_at = parse_timestamp(@created_at) if @created_at
        @links = parse_links(@links) if @links
        @id = @id.to_i if @id
      end

      def allowed_attributes
        [:id, :user, :created_at, :lang, :text, :source, :links, 
         :retweet, :retweet_count]
      end

      private
      def parse_links links
        return [] unless links
        links.collect{|l| parse_uri(l)}
      end
    end
  end
end
