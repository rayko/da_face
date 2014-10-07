module DaFace
  module Twitter
    class User
      include DaFace::Utilities

      attr_reader :id, :created_at, :favourites_count, :friends_count, :geo_enabled,
                  :lang, :listed_count, :name, :profile_image_url, :profile_image_url_https,
                  :screen_name, :statuses_count, :verified


      def initialize data={}
        self.allowed_attributes.each do |attr|
          unless data[attr].nil?
            self.instance_variable_set("@#{attr}", data[attr])
          end
        end
        self.normalize_attributes!
        return self
      end

      def allowed_attributes
        [:id, :created_at, :favourites_count, :friends_count, :geo_enabled,
         :lang, :listed_count, :name, :profile_image_url, :profile_image_url_https,
         :screen_name, :statuses_count, :verified]
      end

      def normalize_attributes!
        @created_at = parse_timestamp(@created_at) if @created_at
        @profile_image_url = parse_uri(@profile_image_url) if @profile_image_url
        @profile_image_url_https = parse_uri(@profile_image_url_https) if @profile_image_url_https
      end
      
      def favourites_count
        @favourites_count || 0
      end

      def favorites_count
        favourites_count
      end

      def friends_count
        @friends_count || 0
      end

      def listed_count
        @listed_count
      end

      def id_str
        @id.to_s
      end

    end
  end
end
