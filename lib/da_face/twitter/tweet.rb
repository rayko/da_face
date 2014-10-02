module DaFace
  module Twitter
    class Tweet
      attr_reader :id
      
      def initialize attrs={}
        @id = attrs['id']
      end
    end
  end
end
