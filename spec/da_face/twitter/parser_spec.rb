require 'spec_helper'

describe DaFace::Twitter::Parser do
  before do
    @data = json_fixture('twitter/simple.json')
  end

  describe '#new' do
    it 'creates a Tweet and User object' do
      obj = DaFace::Twitter::Parser.parse @data, false

      expect(obj.class).to eq(DaFace::Twitter::Tweet)
      expect(obj.user.class).to eq(DaFace::Twitter::User)
    end
  end
end
