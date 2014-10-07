module DaFace
  module Datasift
    class Parser
      include DaFace::Utilities

      def build_object data
        obj = DaFace::Datasift::DaObject.new 

        obj.interaction = DaFace::Datasift::Interaction.new data[:interaction]
        
        return obj
      end

      def parse_from_json json=nil
        raise DaFace::Datasift::MissingJson unless json
        
        data = JSON.parse(json)
        symbolized_data = symbolize_keys(data.keys, data)
        return build_object(symbolized_data)
      end
    end
  end
end
