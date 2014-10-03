module DaFace
  module Twitter
    class Parser
      
      def self.parse data
        tweet = DaFace::Twitter::Tweet.new attributes_for_tweet(data)
        user = DaFace::Twitter::User.new attributes_for_tweeter_user(data['user'])
        tweet.user = user
        
        return tweet
      end

      private
      def self.attributes_for_tweet tweet_data
        tweet = {}
        tweet[:id] =         tweet_data['id']
        tweet[:created_at] = tweet_data['created_at']
        tweet[:lang] =       tweet_data['lang']
        tweet[:text] =       tweet_data['text']
        tweet[:source] =     tweet_data['source']

        tweet
      end
      
      def self.attributes_for_tweeter_user user_data
        user = {}
        user[:id] =                      user_data['id']
        user[:created_at] =              user_data['created_at']
        user[:favourites_count] =        user_data['favourites_count']
        user[:friends_count] =           user_data['friends_count']
        user[:geo_enabled] =             user_data['geo_enabled']
        user[:lang] =                    user_data['lang']
        user[:listed_count] =            user_data['listed_count']
        user[:name] =                    user_data['name']
        user[:profile_image_url] =       user_data['profile_image_url']
        user[:profile_image_url_https] = user_data['profile_image_url_https']
        user[:screen_name] =             user_data['screen_name']
        user[:statuses_count] =          user_data['statuses_count']
        user[:verified] =                user_data['verified']

        user
      end
    end
  end
end
