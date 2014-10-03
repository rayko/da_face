module DaFace
  module Twitter
    class Tweet
      attr_accessor :id, :user
      
      def initialize attrs={}
        @id = attrs['id']
      end
    end
  end
end
