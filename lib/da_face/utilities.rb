module DaFace
  module Utilities

    # Creates a new hash with all keys as symbols, can be
    # any level of depth
    def symbolize_keys keys, hash
      new_hash = {}
      keys.each do |key|
        if hash[key].kind_of? Hash
          new_hash[key.to_sym] = symbolize_keys(hash[key].keys, hash[key])
        elsif hash[key].kind_of? Array
          new_hash[key.to_sym] = []
          hash[key].each do |item|
            if item.kind_of? Hash
              new_hash[key.to_sym] << symbolize_keys(item.keys, item)
            else
              new_hash[key.to_sym] << item
            end
          end
        else
          new_hash[key.to_sym] = hash[key]
        end
      end

      return new_hash
    end

    def parse_uri url
      begin
        URI(URI.encode(url)) if url
      rescue URI::InvalidURIError
        return url
      end
    end
    
    def parse_timestamp timestamp=nil
      return nil unless timestamp
      return Time.at(timestamp) if timestamp.kind_of? Fixnum
      return Time.at(timestamp) if timestamp.kind_of? Float
      return Time.parse(timestamp) if timestamp.kind_of? String
      return timestamp
    end

    def parse_json data
      Yajl::Parser.new.parse(data)
    end

  end
end
