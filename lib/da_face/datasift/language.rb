module DaFace
  module Datasift
    class Language
      attr_reader :confidence, :tag, :tag_extended

      def initialize data={}
        @confidence = data[:confidence]
        @tag = data[:tag]
        @tag_extended = data[:tag_extended]
      end
      
    end
  end
end
