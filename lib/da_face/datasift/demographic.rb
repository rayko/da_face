module DaFace
  module Datasift
    class Demographic
      attr_reader :gender

      def initialize data
        @gender = data[:gender]
      end

    end
  end
end
