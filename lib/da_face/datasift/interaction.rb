module DaFace
  module Datasift
    class Interaction
      attr_accessor :author, :content, :created_at, :id, :link, 
                    :received_at, :schema, :source, :type, :tags,
                    :tag_tree

      def initialize data
        self.author = data['author']
        self.content = data['content']
        self.created_at = parsed_datetime(data['created_at'])
        self.id = data['id']
        self.link = data['link']
        self.received_at = parsed_datetime(data['received_at'])
        self.schema = data['schema']
        self.source = data['source']
        self.type = data['type']
        self.tags = data['tags']
        self.tag_tree = data['tag_tree']
      end

      private
      def parsed_datetime datetime
        datetime.kind_of?(String) ? Time.parse(datetime) : Time.at(datetime)
      end

    end
  end
end
