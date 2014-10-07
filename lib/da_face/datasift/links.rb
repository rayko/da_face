module DaFace
  module Datasift
    class Links < Array
      def initialize data={}
        self.class.get_elements(data).each do |e|
          self << DaFace::Datasift::Link.new(e)
        end
      end

      def self.get_elements data={}
        hashed_links = []
        unless data.empty?
          data.values.first.size.times do |index|
            hashed_links << get_values(index - 1, data.keys, data)
          end
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
