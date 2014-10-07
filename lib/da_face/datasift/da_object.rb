module DaFace
  module Datasift
    class DaObject
      attr_reader :interaction, :demographic, :links, :twitter, :salience, :language

      def initialize data={}
        allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}".to_sym, data[attr])
          end
        end
        normalize_attributes!
        return self
      end

      def normalize_attributes!
      end

      def allowed_attributes
        [:interaction, :demographic, :links, :twitter, :salience, :language]
      end

    end
  end
end
