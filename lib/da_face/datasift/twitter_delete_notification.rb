module DaFace
  module Datasift
    class TwitterDeleteNotification
      attr_reader :interaction_id, :interaction_type, :tweet_id

      def initialize data={}
        raise DaFace::Datasift::BadTwitterDeleteNotification.new('Missing interaction information') unless data[:interaction]
        raise DaFace::Datasift::BadTwitterDeleteNotification.new('Missing twitter information') unless data[:interaction]

        @interaction_id = data[:interaction][:id]
        @interaction_type = data[:interaction][:type]
        @tweet_id = data[:twitter][:id]
      end
    end
  end
end
