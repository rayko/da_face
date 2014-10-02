module DaFace
  module Datasift
    class Links
      attr_reader :links


      def initialize data
        @links = self.class.get_elements data
        @links.map!{|l| DaFace::Datasift::Link.new(l)}
      end

      def [] index
        @links[index]
      end

      def first
        @links.first
      end

      def last
        @links.last
      end

      def each &block
        @links.each &block
      end

      def size
        @links.size
      end

      def inspect
        "<#{self.class}:0x#{(self.object_id << 1).to_s(16)}>"
      end

      def self.get_elements data
        hashed_links = []
        data.values.first.size.times do |index|
          hashed_links << get_values(index - 1, data.keys, data)
        end

        return hashed_links
      end

      # Recursively search the hash for elements of index 'index'
      # from the arrays inside the hashes.
      def self.get_values index, keys, hash
        new_hash = {}
        keys.each do |key|
          if hash[key].kind_of? Hash
            new_hash[key] = get_values(index, hash[key].keys, hash[key])
          else
            new_hash[key] = hash[key][index]
          end
        end
        
        return new_hash
      end


    end
  end
end
