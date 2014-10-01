module DaFace
  module Datasift
    class Language
      attr_accessor :confidence, :tag, :tag_extended

      def initialize data
        self.confidence = data['confidence']
        self.tag = data['tag']
        self.tag_extended = data['tag_extended']
      end
      
    end
  end
end
