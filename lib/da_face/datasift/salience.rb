module DaFace
  module Datasift
    class Salience
      attr_reader :content

      def initialize data
        @content = data[:content]
      end

      def sentiment
        self.content[:sentiment]
      end

    end
  end
end
