module DaFace
  module Datasift
    class Parser
      include DaFace::Utilities

      def build_object data
        symbolized_data = symbolize_keys(data.keys, data)
        DaFace::Datasift::DaObject.new symbolized_data, data
      end

      def build_objects data
        objects = []
        data['interactions'].each do |object_data|
          objects << build_object(object_data)
        end

        return objects
      end

      def parse_collection json=nil
        raise DaFace::Datasift::MissingJson unless json

        data = parse_json(json)
        return build_objects(data)
      end
      
      def parse_from_json json=nil
        raise DaFace::Datasift::MissingJson unless json

        data = parse_json(json)
        return build_object(data)
      end
    end
  end
end
