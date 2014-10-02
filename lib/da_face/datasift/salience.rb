module DaFace
  module Datasift
    class Salience
      attr_accessor :content

      def initialize data
        self.content = data['content']
      end

      def sentiment
        self.content['sentiment']
      end

    end
  end
end
