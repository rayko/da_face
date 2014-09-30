module DaFace
  module Datasift
    class Parser
      def self.hello
        true
      end

      def build_object data
        obj = DaFace::Datasift::DaObject.new 

        obj.interaction = DaFace::Datasift::Interaction.new data['interaction']
        
        return obj
      end

      def parse_from_json json=nil
        raise DaFace::Datasift::MissingJson unless json
        
        data = JSON.parse(json)
        return build_object(data)
      end
    end
  end
end
