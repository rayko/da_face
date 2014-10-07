module DaFace
  module Datasift
    class Link
      include DaFace::Utilities
      
      attr_reader :code, :created_at, :hops, :meta, :normalized_url,
                  :retweet_count, :title, :url

      def initialize data={}
        allowed_attributes.each do |attr|
          if data[attr]
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
        normalize_attributes!

        return self
      end

      def inspect
        "<#{self.class}:0x#{(self.object_id << 1).to_s(16)}>"
      end
      
      def allowed_attributes
        [:code, :created_at, :hops, :meta, :normalized_url,
         :retweet_count, :title, :url]
      end

      private
      def normalize_attributes!
        @created_at = parse_timestamp(@created_at) if @created_at
        @hops = @hops.collect{|d| parse_uri(d)} if @hops
        @normalized_url = parse_uri(@normalized_url) if @normalized_url
        @url = parse_uri(@url) if @url
      end
    end
  end
end
