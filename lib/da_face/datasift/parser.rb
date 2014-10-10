module DaFace
  module Datasift
    class Parser
      include DaFace::Utilities

      def build_object data
        DaFace::Datasift::DaObject.new data
      end

      def build_objects data
        objects = []
        data[:interactions].each do |object_data|
          objects << build_object(object_data)
        end

        return objects
      end

      def parse_collection json=nil
        raise DaFace::Datasift::MissingJson unless json

        data = JSON.parse(json)
        symbolized_data = symbolize_keys(data.keys, data)
        return build_objects(symbolized_data)
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
