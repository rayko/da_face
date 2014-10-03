require 'spec_helper'

describe DaFace::Twitter::Tweet do
  describe '#new' do
    before do
      @tweet = DaFace::Twitter::Parser.attributes_for_tweet(json_fixture('twitter/simple.json'))
    end

    it 'creates a Tweet object' do
      obj = DaFace::Twitter::Tweet.new @tweet
    end
  end
  
  describe 'attributes' do
    before do 
      @data = DaFace::Twitter::Parser.attributes_for_tweet(json_fixture('twitter/simple.json')).merge(:retweet => false)
      @tweet = DaFace::Twitter::Tweet.new @data
    end
    
    it 'has all required attributes' do
      expect(@tweet.id).to eq(@data[:id])
      expect(@tweet.created_at.class).to eq(Time)
      expect(@tweet.created_at).to eq(Time.parse(@data[:created_at]))
      expect(@tweet.lang).to eq(@data[:lang])
      expect(@tweet.text).to eq(@data[:text])
      expect(@tweet.source).to eq(@data[:source])
      expect(@tweet.links.class).to eq(Array)
      expect(@tweet.links.first).to eq(URI(@data[:links].first))
      expect(@tweet.retweet?).to eq(false)
      expect(@tweet.retweet_count).to eq(0)
    end
  end
end
