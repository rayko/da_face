module DaFace
  module Datasift
    class DaObject
      TWITTER_INTERACTION = :twitter_interaction
      TWITTER_DELETE_NOTIFICATION = :delete_notification
      TWITTER_USER_NOTIFICATION = :user_notification
      
      attr_reader :interaction, :demographic, :links, :twitter, :salience, :language, :kind, :raw

      def initialize data={}, raw_data={}
        @raw = raw_data
        if data[:deleted]
          @twitter = DaFace::Datasift::TwitterDeleteNotification.new(data)
        else
          @twitter = DaFace::Datasift::Twitter.new(data[:twitter]) if data[:twitter]
        end

        @interaction = DaFace::Datasift::Interaction.new(data[:interaction]) if data[:interaction]
        @demographic = DaFace::Datasift::Demographic.new(data[:demographic]) if data[:demographic]
        @links = DaFace::Datasift::Links.new(data[:links]) if data[:links]
        @salience = DaFace::Datasift::Salience.new(data[:salience]) if data[:salience]
        @language = DaFace::Datasift::Language.new(data[:language]) if data[:language]
        
        set_kind! if data.any?

        return self
      end

      def set_kind!
        @kind = TWITTER_INTERACTION if @interaction.type == 'twitter'
        @kind = TWITTER_DELETE_NOTIFICATION if @twitter.class == DaFace::Datasift::TwitterDeleteNotification
        @kind = TWITTER_USER_NOTIFICATION if @twitter.class == DaFace::Datasift::TwitterUserStatus
      end
    end
  end
end
