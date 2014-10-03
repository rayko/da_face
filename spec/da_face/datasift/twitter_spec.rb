require 'spec_helper'

describe DaFace::Datasift::Twitter do
  describe '#new' do
    before do
      @data = json_fixture('twitter/simple.json')
    end
    
    it 'creates a Twitter object' do
      obj = DaFace::Datasift::Twitter.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Twitter)
    end
  end

  describe 'attributes' do

    
    context 'normal tweet' do
      before do
        @data = json_fixture('twitter/simple.json')
        @twitter = DaFace::Datasift::Twitter.new @data
      end
      it 'has tweet information' do
        expect(@twitter.tweet).not_to eq(nil)
        expect(@twitter.retweet).to eq(nil)
        expect(@twitter.retweeted).to eq(nil)
        expect(@twitter.tweet.id).to eq(@data['id'])
      end
    end
    
    context 'retweet' do
      before do
        @data = json_fixture('twitter/retweet.json')
        @twitter = DaFace::Datasift::Twitter.new @data
      end
      it 'has tweet and retweet informacion' do
        expect(@twitter.tweet).to eq(nil)
        expect(@twitter.retweet).not_to eq(nil)
        expect(@twitter.retweeted).not_to eq(nil)
        expect(@twitter.retweet.id).to eq(@data['retweet']['id'])
        expect(@twitter.retweeted.id).to eq(@data['retweeted']['id'])
        expect(@twitter.retweet.id).not_to eq(@twitter.retweeted.id)
        expect(@twitter.retweet.retweet).to eq(true)
      end
    end
  end
end

