module DaFace
  module Twitter
    class User
      attr_reader :id, :created_at, :favourites_count, :friends_count, :geo_enabled,
                  :lang, :listed_count, :name, :profile_image_url, :profile_image_url_https,
                  :screen_name, :statuses_count, :verified

      def initialize data
        @id = data[:id]
        @created_at = Time.parse(data[:created_at])
        @lang = data[:lang]
        @profile_image_url = parse_url(data[:profile_image_url])
        @profile_image_url_https = parse_url(data[:profile_image_url_https])

        @favourites_count = data[:favourites_count] || 0
        @friends_count = data[:friends_count] || 0
        @listed_count = data[:listed_count] || 0

        @geo_enabled = data[:geo_enabled]
        @name = data[:name]
        @screen_name = data[:screen_name]
        @statuses_count = data[:statuses_count]
        @verified = data[:verified]
      end

      def id_str
        @id.to_s
      end

      private
      def parse_url link
        if link
          URI(link)
        end
      end
    end
  end
end
