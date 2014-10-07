module DaFace
  module Datasift
    class Interaction
      include DaFace::Utilities

      attr_reader :author, :content, :created_at, :id, :link, 
                  :received_at, :schema, :source, :type, :tags,
                  :tag_tree

      def initialize data={}
        allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
        normalize_attributes!
        return self
      end

      def allowed_attributes
        [:author, :content, :created_at, :id, :link, 
         :received_at, :schema, :source, :type, :tags,
         :tag_tree]
      end

      def normalize_attributes!
        @created_at = parse_timestamp(@created_at) if @created_at
        @received_at = parse_timestamp(@received_at) if @received_at
      end

    end
  end
end
