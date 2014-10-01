module DaFace
  module Datasift
    class Demographic
      attr_accessor :gender

      def initialize data
        self.gender = data['gender']
      end

    end
  end
end
