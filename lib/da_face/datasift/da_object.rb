module DaFace
  module Datasift
    class DaObject
      attr_reader :interaction, :demographic, :links, :twitter, :salience, :language

      def initialize data
        @interaction = DaFace::Datasift::Interaction.new data['interaction']
        @demographic = DaFace::Datasift::Demographic.new data['demographic']
        @links = DaFace::Datasift::Links.new data['links']
        @twitter = DaFace::Datasift::Twitter.new data['twitter']
        @salience = DaFace::Datasift::Salience.new data['salience']
        @language = DaFace::Datasift::Language.new data['language']
      end
    end
  end
end
