module DaFace
  module Datasift
    class Link
      attr_accessor :code, :created_at, :hops, :meta, :normalized_url,
                    :retweet_count, :title, :url

      def initialize data
        self.code = data['code']
        self.created_at = parsed_datetime(data['created_at'])
        self.hops = data['hops'].collect{|d| string_to_uri(d)}
        self.meta = data['meta']
        self.normalized_url = string_to_uri(data['normalized_url'])
        self.retweet_count = data['retweet_count']
        self.title = data['title']
        self.url = string_to_uri(data['url'])
      end

      def inspect
        "<#{self.class}:0x#{(self.object_id << 1).to_s(16)}>"
      end

      private
      def parsed_datetime datetime
        Time.parse(datetime)
      end

      def string_to_uri url
        URI(url) if url
      end
    end
  end
end
